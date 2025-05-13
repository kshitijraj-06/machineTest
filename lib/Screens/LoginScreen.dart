import 'package:cs_tech/Services/device_info_service.dart';
import 'package:cs_tech/Services/otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.put(OtpService());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png',
                  scale: 1.9),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(24)),
                    ),
                    child: Text(
                      "Phone",
                      style: GoogleFonts.poppins(
                        color:  Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.horizontal(right: Radius.circular(24)),
                    ),
                    child: Text(
                      "Email",
                      style: GoogleFonts.poppins(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Glad to see you!',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              SizedBox(height: 12,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Please Provide your Mobile Number',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.grey
                ),),
              ),
              SizedBox(height: 32),
              TextField(
                controller: controller.phoneController,
                decoration: InputDecoration(
                  hintText:'Mobile Number',
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
              ),
              SizedBox(height: 32),
              // Send Code button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.sendOtp();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFBDBD), // Light red
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    "SEND CODE",
                    style: GoogleFonts.poppins(
                      color: Color(0xFFD32F2F), // Red text
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32),

              // ElevatedButton(onPressed: (){
              //   Get.offNamed('/landing');
              // }, child: Text('Get OTP')),
              // ElevatedButton(onPressed: (){
              //   Get.offNamed('/otp_verify');
              // }, child: Text('OTP VErification'))
            ],
          ),
        ),
      ),
    );
  }
}