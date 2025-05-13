import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'device_info_service.dart';
import 'otp.dart';

class OTPVerificationService extends GetxController {
  final otpcontroller = TextEditingController();
  final InfoService infoService = Get.find<InfoService>();
  final OtpService otpService = Get.find<OtpService>();

  Future<void> verifyotp() async {
    print(infoService.deviceId);
    print(otpService.userId.value);
    try {
      if (infoService.deviceId.isEmpty || otpService.userId.isEmpty) {
        print('Error: deviceId or userId is empty');
        return;
      }

      final response = await http.post(
        Uri.parse('http://devapiv4.dealsdray.com/api/v2/user/otp/verification'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'otp': otpcontroller.text,
          'deviceId':  infoService.deviceId.value,
          'userId': otpService.userId.value
        }),
      );
      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        final status = data['data']['registration_status'];
        if(status == 'Incomplete'){
          Get.offAllNamed('/register');
        }else{
          Get.offAllNamed('/dashboard');
        }
        print(status);
      }
      print(response.body);
    } catch (e) {
      print('Error sending OTP: $e');
    }
  }
}
