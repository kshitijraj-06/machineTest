import 'package:cs_tech/Screens/LoginScreen.dart';
import 'package:cs_tech/Screens/dashboard.dart';
import 'package:cs_tech/Screens/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Screens/landing.dart';
import 'Screens/otp_verification.dart';
import 'Services/device_info_service.dart';
import 'Services/otp.dart';

void main()async{
  runApp(CSTechApp());
  Get.put(InfoService());
  Get.put(OtpService());
}

class CSTechApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/landing',
      getPages: [
        GetPage(name: '/login', page: () => LoginScreen(),
        ),
        GetPage(name: '/landing', page: () => SplashScreen(),
        ),
        GetPage(name: '/otp_verify', page: () => OTPVerification(),
        ),
        GetPage(name: '/register', page: () => Register()
        ),
        GetPage(name: '/dashboard', page: ()=> Dashboard()
        )
      ],
    );
  }
}