import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../Services/device_info_service.dart';

class SplashScreen extends StatefulWidget {
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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (infoService.deviceId.isNotEmpty)
                  Text('Device ID: ${infoService.deviceId}',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                if (infoService.errorMessage.value.isNotEmpty) ...[
                  SizedBox(height: 20),
                  Text('Error: ${infoService.errorMessage.value}',
                      style: TextStyle(color: Colors.red)),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: collectsendData,
                    child: Text('Retry'),
                  )
                ],
                if (infoService.deviceInfo.value != null)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text('Collected Data:\n${jsonEncode(infoService.deviceInfo.value!.toJson())}',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
              ],
            );
          })
        ),
      ]),
    );
  }
}
