import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../Services/device_info_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final InfoService infoService = Get.put(InfoService());

  @override
  void initState() {
    super.initState();
    collectsendData();
  }

  Future<void> collectsendData() async {
    await infoService.collectData();

    if (infoService.deviceInfo.value != null) {
      await infoService.sendData();
    }

    if (infoService.errorMessage.isEmpty) {
      Get.offAllNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Device Info Sender')),
      body: Stack(
        children:[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/splash.jpg',),
              fit: BoxFit.cover
              )
            )
          ),
          Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx((){
            if(infoService.isLoading.value){
              return Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: LoadingIndicator(
                      indicatorType: Indicator.ballClipRotatePulse,
                  ),
                ),
              );
            }
            return Column();
          })
        ),
      ]),
    );
  }
}
