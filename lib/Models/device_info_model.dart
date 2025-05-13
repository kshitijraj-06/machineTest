import 'package:cs_tech/Models/app_info_model.dart';

class DeviceInfo {
  final String deviceType;
  final String deviceId;
  final String deviceName;
  final String deviceOSVersion;
  final String deviceIPAddress;
  final double lat;
  final double long;
  final String buyerGcmid;
  final String buyerPemid;
  final AppInfo app;

  DeviceInfo({
    required this.deviceType,
    required this.deviceId,
    required this.deviceName,
    required this.deviceOSVersion,
    required this.deviceIPAddress,
    required this.lat,
    required this.long,
    required this.buyerGcmid,
    required this.buyerPemid,
    required this.app,
});

  Map<String, dynamic> toJson() => {
    'deviceType': deviceType,
    'deviceId': deviceId,
    'deviceName': deviceName,
    'deviceOSVersion': deviceOSVersion,
    'deviceIPAddress': deviceIPAddress,
    'lat': lat,
    'long': long,
    'buyerGcmid': buyerGcmid,
    'buyerPemid': buyerPemid,
    'app': app.toJson(),
  };
}