import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medilink/common/button.dart';
import 'package:medilink/common/register_text_field.dart';
import 'package:medilink/features/Register/screens/register_profileimage_page.dart';
// import 'package:medilink/utils/form_validation.dart';

class RegisterAddressPage extends StatefulWidget {
  const RegisterAddressPage({super.key});

  @override
  State<RegisterAddressPage> createState() =>
      _RegisterAdressPagePagePageState();
}

class _RegisterAdressPagePagePageState extends State<RegisterAddressPage> {
  TextEditingController countryController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController addressLineController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();

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
                  padding: const EdgeInsets.only(right: 75, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Register your Address",
                        style: TextStyle(
                          color: const Color(0xff1c1e21),
                          fontSize: 25,
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Please provide your current address \n details below.",
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
                        padding: const EdgeInsets.only(top: 25, bottom: 10),
                        controller: regionController,
                        hintText: 'Region',
                        obscureText: false,
                        next: true,
                        width: 345,
                        // validator: FormValidation.passwordValidation,
                      ),
                      MyTextfield(
                        // validator:() => FormValidation.emaiValidation(passwordController.text, "mail"),
                        padding: const EdgeInsets.only(top: 15, bottom: 10),
                        controller: addressLineController,
                        hintText: 'Address Line',
                        obscureText: false,
                        next: true,
                        width: 345,
                        // validator: FormValidation.passwordValidation,
                      ),
                      MyTextfield(
                        // validator:() => FormValidation.emaiValidation(passwordController.text, "mail"),
                        padding: const EdgeInsets.only(top: 15, bottom: 10),
                        controller: cityController,
                        hintText: 'City',
                        obscureText: false,
                        next: true,
                        width: 345,
                        // validator: FormValidation.passwordValidation,
                      ),
                      MyTextfield(
                        // validator:() => FormValidation.emaiValidation(passwordController.text, "mail"),
                        padding: const EdgeInsets.only(top: 15, bottom: 10),
                        controller: stateController,
                        hintText: 'State',
                        obscureText: false,
                        next: true,
                        width: 345,
                        // validator: FormValidation.passwordValidation,
                      ),
                      MyTextfield(
                        // validator:() => FormValidation.emaiValidation(passwordController.text, "mail"),
                        padding: const EdgeInsets.only(top: 15, bottom: 35),
                        controller: zipCodeController,
                        hintText: 'Zip Code',
                        obscureText: false,
                        next: false,
                        width: 345,
                        // validator: FormValidation.passwordValidation,
                      ),
                    ],
                  ),
                ),
                MyButton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      // Get.find<RegisterPageController>()
                      //     .setPassword();
                      Get.to(() => const RegisterProfileImagePage(),
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
