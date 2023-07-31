import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medilink/features/Login/screens/login_page.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:medilink/features/Profile/screens/patient_profile_page.dart';
import 'package:medilink/features/Profile/screens/view_patient_profile.dart';
import 'package:medilink/features/auth/controller/token_controller.dart';
import 'package:path_provider/path_provider.dart';

import 'features/Login/controller/fetch_user_data_controller.dart';

// Box? tokenBox;

Future<Box> openHiveBox(String boxname) async {
  if (!Hive.isBoxOpen(boxname)) {
    Hive.init((await getApplicationDocumentsDirectory()).path);
  }
  return Hive.openBox(boxname);
}

bool isValid() {
  if (Get.find<TokenController>().getToken() != "") {
    return true;
  }
  return false;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await openHiveBox("tokenBox");
  await openHiveBox("userDataBox");
  Get.put(TokenController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset(
          "assets/images/medilink-high-resolution-logo-color-on-transparent-background.png",
        ),
        splashIconSize: 140,
        nextScreen: isValid() ? PatientProfilePage() : const LoginPage(),
      ),
    );
  }
}
