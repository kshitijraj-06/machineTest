import 'package:cs_tech/Services/register_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final RegisterService registerService = Get.put(RegisterService());
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: [
                  Image.asset('assets/logo.png',
                  scale: 1.7,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Let's begin!",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                  SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Please enter your credentials to proceed",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  SizedBox(height: 32,),
                  TextField(
                    controller: registerService.emailcontroller,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: registerService.passwordcontroller,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    )
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: registerService.referralcontroller,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      hintText: 'Referral Code (Optional)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 24),
                  // Obx(() => registerService.isLoading.value
                  //     ? CircularProgressIndicator()
                  //     : ElevatedButton(
                  //   onPressed: () async {
                  //     await registerService.register();
                  //     // Optionally show feedback
                  //     if (registerService.errorMessage.isNotEmpty) {
                  //       Get.snackbar('Error', registerService.errorMessage.value,
                  //           backgroundColor: Colors.red, colorText: Colors.white);
                  //     } else {
                  //       Get.snackbar('Success', 'Registration successful!',
                  //           backgroundColor: Colors.green, colorText: Colors.white);
                  //     }
                  //   },
                  //   child: Text('Submit'),
                  // )),
                  Obx(() => registerService.isLoading.value
                  ? LoadingIndicator(
                    indicatorType: Indicator.ballClipRotatePulse,
                  )
                      :Align(
                      alignment: Alignment.centerRight,
                      child: FloatingActionButton(
                        onPressed: ()async {
                          await registerService.register();
                        },
                        backgroundColor: Color(0xFFD32F2F),
                        child: Icon(Icons.arrow_forward, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
