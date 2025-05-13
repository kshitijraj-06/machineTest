import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'device_info_service.dart';

class OtpService extends GetxController {
  final phoneController = TextEditingController();
  final InfoService infoService = Get.find<InfoService>(); // Use existing instance
  var userId = ''.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> sendOtp() async {
    isLoading.value = true;
    errorMessage.value = '';
    final phone = phoneController.text.trim();

    if (phone.isEmpty || infoService.deviceId.isEmpty) {
      errorMessage.value = 'Phone number or device ID is missing';
      isLoading.value = false;
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('http://devapiv4.dealsdray.com/api/v2/user/otp'),
        headers: {'Content-Type': 'application/json'}, // Add header
        body: jsonEncode({ // Use proper JSON encoding
          'mobileNumber': phone,
          'deviceId': infoService.deviceId.value, // Access from GetX-managed service
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        userId.value = data['data']['userId']?.toString() ?? ''; // Update observable
        print('OTP sent successfully. User ID: ${userId.value}');
        Get.offNamed('/otp_verify');
      } else {
        errorMessage.value = 'Failed to send OTP: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage.value = 'Error sending OTP: ${e.toString()}';
      print('Error details: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
