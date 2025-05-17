import 'dart:convert';

import 'package:cs_tech/Services/otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RegisterService extends GetxController {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final referralcontroller = TextEditingController();
  final OtpService otpService = Get.find<OtpService>();
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> register() async {
    final email = emailcontroller.text.trim();
    final password = passwordcontroller.text.trim();
    final referralCodeText = referralcontroller.text.trim();
    final userId = otpService.userId.value;

    if (email.isEmpty || password.isEmpty || userId.isEmpty) {
      Get.snackbar('Error', 'Please fill in all fields',
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    int? referralCode = int.tryParse(referralCodeText);

    try {
      final response = await http.post(
        Uri.parse('http://devapiv4.dealsdray.com/api/v2/user/email/referral'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
          'referralCode': referralCode ?? null,
          'userId': userId,
        }),
      );

      // print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        print('Registration successful!');
        Get.snackbar('Success', 'Registration successful!',
            backgroundColor: Colors.green, colorText: Colors.white);
        Get.offAllNamed('/dashboard');

      } else {
        print('Registration failed: ${response.body}');
        Get.snackbar('Error', response.body,
            backgroundColor: Colors.red, colorText: Colors.white);

      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
