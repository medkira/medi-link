import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medilink/auth/login_or_register.dart';
import 'package:medilink/features/Login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: LoginOrRegister(),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset(
          "assets/images/medilink-high-resolution-logo-color-on-transparent-background.png",
        ),
        splashIconSize: 140,
        nextScreen: const LoginPage(),
      ),
    );
  }
}
