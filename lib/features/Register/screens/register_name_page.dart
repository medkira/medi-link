import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medilink/common/widgets/button.dart';
import 'package:medilink/common/widgets/register_text_field.dart';
import 'package:medilink/features/Register/screens/register_email_page.dart';

import '../controller/register_page_controller.dart';

class RegisterNamePage extends StatefulWidget {
  const RegisterNamePage({super.key});

  @override
  State<RegisterNamePage> createState() => _RegisterNamePageState();
}

class _RegisterNamePageState extends State<RegisterNamePage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
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
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 95, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "What's your name?",
                      style: TextStyle(
                        color: const Color(0xff1c1e21),
                        fontSize: 24,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Enter the name you use in real life.",
                      style: TextStyle(
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontSize: 16,
                          color: const Color.fromARGB(255, 89, 88, 89)),
                    ),
                  ],
                ),
              ),
              Form(
                key: formKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyTextfield(
                      controller: firstNameController,
                      hintText: 'first name',
                      obscureText: false,
                      next: true,
                      width: 168,
                    ),
                    MyTextfield(
                      controller: lastNameController,
                      hintText: 'last name',
                      obscureText: false,
                      next: true,
                      width: 168,
                    ),
                  ],
                ),
              ),
              MyButton(
                onTap: () {
                  Get.find<RegisterPageController>()
                      .setFirstname(firstNameController.text);
                  Get.find<RegisterPageController>()
                      .setLastname(lastNameController.text);

                  Get.to(() => const RegisterEmaiPage(),
                      transition: Transition.rightToLeft);
                },
                text: "Next",
                color: const Color(0xff1479FF),
                width: 350,
                fontSize: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
