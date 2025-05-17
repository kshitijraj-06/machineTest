import 'dart:async';
import 'package:cs_tech/Services/otp.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../Services/otp_verification.dart';

class OTPVerification extends StatefulWidget{
  const OTPVerification({super.key});

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  final _focusNode = FocusNode();
  final otpVerificationService = Get.put(OTPVerificationService());
  final OtpService otpService = Get.find<OtpService>();
  Timer? _timer;
  int _start = 120;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        timer.cancel();
      } else {
        setState(() => _start--);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final minutes = (_start ~/ 60).toString().padLeft(2, '0');
    final seconds = (_start % 60).toString().padLeft(2, '0');
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 22, color: Colors.blue[900], fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
    );
    return Scaffold(
      //appBar: AppBar(title: Text('Enter OTP')),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
                    onPressed: () => Get.back(),
                  ),
                ),
                SizedBox(height: 16,),
                Image.asset('assets/otp.png',
                width: 180,
                height: 180,),
                SizedBox(height: 40,),
                Text(
                  'OTP Verification',
                  style: GoogleFonts.poppins(
                      fontSize: 25,
                  fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  "We have sent a unique OTP number\nto your mobile ${otpService.phoneController.text}",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32),
                Pinput(
                  length: 4,
                  controller: otpVerificationService.otpcontroller,
                  focusNode: _focusNode,
                  defaultPinTheme: defaultPinTheme,
                  validator: (value) {
                    if (value == null || value.length != 4) {
                      return 'Enter all 4 digits';
                    }
                    return null;
                  },
                  showCursor: true,
                  onCompleted: (pin) {
                    otpVerificationService.verifyotp();
                  }
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$minutes : $seconds",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 24),
                      GestureDetector(
                        onTap: _start == 0
                            ? () {
                          _startTimer();
                          otpService.sendOtp();
                        }
                            : null,
                        child: Text(
                          "SEND AGAIN",
                          style: TextStyle(
                            fontSize: 16,
                            color: _start == 0 ? Colors.red : Colors.grey,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 24),
                // ElevatedButton(
                //   onPressed: (){
                //     otpVerificationService.verifyotp();
                //   },
                //   child: Text('Submit'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}