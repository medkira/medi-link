import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medilink/common/widgets/button.dart';
import 'package:medilink/common/widgets/register_text_field.dart';
import 'package:medilink/features/Register/screens/register_password_page.dart';
import 'package:medilink/utils/form_validation.dart';

import '../controller/register_page_controller.dart';

class RegisterEmaiPage extends StatefulWidget {
  const RegisterEmaiPage({super.key});

  @override
  State<RegisterEmaiPage> createState() => _RegisterEmaiPagePageState();
}

class _RegisterEmaiPagePageState extends State<RegisterEmaiPage> {
  final emailController = TextEditingController();

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
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 110, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "What's your email?",
                        style: TextStyle(
                          color: const Color(0xff1c1e21),
                          fontSize: 24,
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Enter the email where you can \n be conacted.",
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyTextfield(
                        // validator:() => FormValidation.emaiValidation(emailController.text, "mail"),
                        controller: emailController,
                        hintText: 'email',
                        obscureText: false,
                        next: false,
                        width: 345,
                        validator: FormValidation.emaiValidation,
                      ),
                    ],
                  ),
                ),
                MyButton(
                  onTap: () {
                    // print(FocusManager.instance.primaryFocus);
                    if (formKey.currentState!.validate()) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      Future.delayed(
                        const Duration(milliseconds: 400),
                        () {
                          Get.to(() => const RegisterPasswordPage(),
                              transition: Transition.rightToLeft);
                          Get.find<RegisterPageController>()
                              .setEmail(emailController.text);
                        },
                      );
                    }
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
      ),
    );
  }
}
