// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:medilink/features/Login/login_page.dart';
// import 'package:medilink/features/Register/unbording_page.dart';

// class LoginOrRegister extends StatefulWidget {
//   const LoginOrRegister({super.key});

//   @override
//   State<LoginOrRegister> createState() => _LoginOrRegisterState();
// }

// class _LoginOrRegisterState extends State<LoginOrRegister> {
//   bool showLoginPage = true;

//   void tooglePages() {
//     // setState(() {
//     //   showLoginPage = !showLoginPage;
//     // });
//     Get.to(() => UnbordingPage(), transition: Transition.downToUp);
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (showLoginPage) {
//       return LoginPage();
//     } else {
//       return UnbordingPage();
//     }
//   }
// }
