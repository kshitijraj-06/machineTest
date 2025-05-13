import 'dart:convert';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';

import '../Models/app_info_model.dart';
import '../Models/device_info_model.dart';

class InfoService extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var deviceInfo = Rxn<DeviceInfo>();
  var deviceId = ''.obs;

  Future<void> collectData() async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      final deviceInfoPlugin = DeviceInfoPlugin();
      final packageInfo = await PackageInfo.fromPlatform();
      final position = await Geolocator.getCurrentPosition();
      final ipaddress = await http.get(Uri.parse('https://api.ipify.org'));
      final androidInfo = await deviceInfoPlugin.androidInfo;

      final info = DeviceInfo(
        deviceType: 'android',
        deviceId: androidInfo.id ?? '',
        deviceName: androidInfo.model ?? '',
        deviceOSVersion: androidInfo.version.release ?? '',
        deviceIPAddress: ipaddress.body,
        lat: position.latitude,
        long: position.longitude,
        buyerGcmid: '',
        buyerPemid: '',
        app: AppInfo(
          version: packageInfo.version,
          installTimeStamp: DateTime.now().toIso8601String(),
          uninstallTimeStamp: '',
          downloadTimeStamp: DateTime.now().toIso8601String(),
        ),
      );
      deviceInfo.value = info;
    } catch (e) {
      errorMessage.value = 'Error collecting data: $e';
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> sendData() async {
    if (deviceInfo.value == null) {
      errorMessage.value = 'No device data to send';
      return;
    }
    isLoading.value = true;
    errorMessage.value = '';
    try {
      final response = await http.post(
        Uri.parse('http://devapiv4.dealsdray.com/api/v2/user/device/add'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(deviceInfo.value!.toJson()),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        deviceId.value = data['data']['deviceId'] ?? '';
        print('Device ID: ${deviceId.value}');
      } else {
        errorMessage.value = 'Failed to send data: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage.value = 'Error sending data: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
