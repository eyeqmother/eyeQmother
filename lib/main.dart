import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quzzapp1/Screens/login_widget.dart';
import 'package:quzzapp1/resources/app_images.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(const LoginWidget());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4B39EF),
      body: Center(
        child: Image.asset(
          AppImages().splash, // Replace with your own app icon image path
          width: Get.width / 2,
          height: Get.width / 2,
        ),
      ),
    );
  }
}
