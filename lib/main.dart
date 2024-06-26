import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eyeqmother/Screens/login_widget.dart';
import 'package:eyeqmother/resources/app_images.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBlNlO8G-ERvIrHTfPUlPNXElqw2sIhjTs",
      appId: "1:365727313262:android:27b292d9b60125c050257f",
      messagingSenderId: "365727313262",
      projectId: "eyeq-e5431",
    ),
  );
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
