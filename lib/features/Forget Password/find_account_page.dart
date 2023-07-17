import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medilink/common/button.dart';
import 'package:medilink/common/register_text_field.dart';
import 'package:medilink/features/Forget%20Password/confirm_account_page.dart';
import 'package:medilink/features/Register/screens/register_password_page.dart';
import 'package:medilink/utils/form_validation.dart';

class FindAccountPage extends StatefulWidget {
  const FindAccountPage({super.key});

  @override
  State<FindAccountPage> createState() => _FindAccountPagePageState();
}

class _FindAccountPagePageState extends State<FindAccountPage> {
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
                  padding: const EdgeInsets.only(right: 140, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Find your account",
                        style: TextStyle(
                          color: const Color(0xff1c1e21),
                          fontSize: 24,
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Enter your email.",
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
                    if (formKey.currentState!.validate() || true) {
                      Get.to(() => const ConfirmAccountPage(),
                          transition: Transition.rightToLeft);
                    }
                  },
                  text: "Find account",
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
