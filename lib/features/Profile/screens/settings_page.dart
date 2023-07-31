import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:medilink/common/animation/opencontainer_animation.dart';
import 'package:medilink/common/widgets/categories_scroller.dart';
import 'package:medilink/extensions/color.dart';
import 'package:medilink/features/Login/controller/fetch_user_data_controller.dart';
import 'package:medilink/features/Login/controller/user_data_controller.dart';
import 'package:medilink/features/Login/screens/login_page.dart';
import 'package:medilink/features/auth/controller/token_controller.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});
  final TokenController tokenController = Get.put(TokenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(
          color: Color(0xff1479FF),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(11.0),
            child: OpenContainerAnimation(
              color: Colors.white,
              raduisBorder: 18,
              widget: SizedBox(
                // width: 350,
                height: 100,
                // padding: const EdgeInsets.all(50),
                child: Row(
                  children: [
                    const SizedBox(width: 25),
                    SizedBox(
                      child: Image.asset(
                        'assets/images/identification-card (1).png',
                        width: 50,
                        height: 50,
                        color: Globals.primaryColor,
                      ),
                    ),
                    const SizedBox(width: 25),
                    const Text(
                      "Change Prsonal File",
                      style: TextStyle(
                          color: Globals.primaryColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(width: 28)
                  ],
                ),
              ),
              navigateToWidget: const Text("hi"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: OpenContainerAnimation(
              color: Colors.white,
              raduisBorder: 18,
              widget: SizedBox(
                // width: 350,
                height: 100,
                // padding: const EdgeInsets.all(50),
                child: Row(
                  children: [
                    const SizedBox(width: 25),
                    SizedBox(
                      child: Image.asset(
                        'assets/images/medical-folder.png',
                        width: 50,
                        height: 50,
                        color: Globals.primaryColor,
                      ),
                    ),
                    const SizedBox(width: 25),
                    const Text(
                      "Change Medical File",
                      style: TextStyle(
                          color: Globals.primaryColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(width: 30)
                  ],
                ),
              ),
              navigateToWidget: const Text("hi"),
            ),
          ),
          // CategoriesList(),
          MaterialButton(
            onPressed: () {
              Get.find<TokenController>().deleteToken();
              Get.put(UserDataController());
              Get.find<UserDataController>().deleteUserData();
              Get.offAll(() => const LoginPage());
            },
            child: const Text("logout"),
          ),
          MaterialButton(
            onPressed: () {
              Get.put(UserDataController());
            },
            child: const Text("TEST"),
          ),

          Container(
            padding: const EdgeInsets.only(top: 25),
            child: Obx(
              () {
                Get.put(UserDataController());

                String username = Get.find<UserDataController>().username.value;
                return Text(
                  username,
                  style: const TextStyle(fontSize: 23),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
