import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appimages.dart';

class LogoScreen extends StatelessWidget {
  const LogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 6), () {
      Get.offNamed("languages");
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Appimages.logo,
              width: 300,
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}
