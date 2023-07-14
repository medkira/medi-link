import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medilink/common/button.dart';
import 'package:medilink/common/register_text_field.dart';
import 'package:medilink/features/Register/register_type_page.dart';
import 'package:medilink/utils/form_validation.dart';

class RegisterPasswordPage extends StatefulWidget {
  const RegisterPasswordPage({super.key});

  @override
  State<RegisterPasswordPage> createState() => _RegisterEmaiPagePageState();
}

class _RegisterEmaiPagePageState extends State<RegisterPasswordPage> {
  final passwordController = TextEditingController();

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
                  padding: const EdgeInsets.only(right: 10, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create a password",
                        style: TextStyle(
                          color: const Color(0xff1c1e21),
                          fontSize: 25,
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Create apassword with at least 6 letters or\n numbers. it should be something others can't \n guess",
                        style: TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontSize: 16,
                            color: const Color.fromARGB(255, 89, 88, 89),
                            height: 1.25),
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
                        // validator:() => FormValidation.emaiValidation(passwordController.text, "mail"),
                        controller: passwordController,
                        hintText: 'Password',
                        obscureText: true,
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
                      Get.to(() => const RegisterTypedPage(),
                          transition: Transition.rightToLeft);
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
