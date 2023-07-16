import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medilink/common/button.dart';
import 'package:medilink/common/register_text_field.dart';
import 'package:medilink/features/Home/home_page.dart';
import 'package:medilink/features/Register/controller/register_page_controller.dart';

class RegisterDoctorInfoPage extends StatefulWidget {
  const RegisterDoctorInfoPage({super.key});

  @override
  State<RegisterDoctorInfoPage> createState() =>
      _RegisterDoctorInfoPagePagePageState();
}

class _RegisterDoctorInfoPagePagePageState
    extends State<RegisterDoctorInfoPage> {
  final _specialityController = TextEditingController();
  final _qualificationController = TextEditingController();
  final _experienceController = TextEditingController();
  final _assuranceController = TextEditingController();

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
                  padding: const EdgeInsets.only(right: 20, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "your professional details ",
                        style: TextStyle(
                          color: const Color(0xff1c1e21),
                          fontSize: 25,
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Please provide your professional details \n This will help us understand your expertise \n and offer the best care to our patients.",
                        style: TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontSize: 16,
                            color: const Color.fromARGB(255, 89, 88, 89),
                            height: 1.32),
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
                        controller: _specialityController,
                        hintText: 'Speciality',
                        obscureText: false,
                        next: true,
                        width: 345,
                        padding: const EdgeInsets.only(top: 25, bottom: 10),
                        // validator: FormValidation.passwordValidation,
                      ),
                      MyTextfield(
                        // validator:() => FormValidation.emaiValidation(passwordController.text, "mail"),
                        controller: _qualificationController,
                        hintText: 'Sualification',
                        obscureText: false,
                        next: true,
                        width: 345,
                        padding: const EdgeInsets.only(top: 15, bottom: 10),

                        // validator: FormValidation.passwordValidation,
                      ),
                      MyTextfield(
                        // validator:() => FormValidation.emaiValidation(passwordController.text, "mail"),
                        controller: _experienceController,
                        hintText: 'Experience (in years)',
                        obscureText: false,
                        next: true,
                        width: 345,
                        padding: const EdgeInsets.only(top: 15, bottom: 10),

                        // validator: FormValidation.passwordValidation,
                      ),
                      MyTextfield(
                        // validator:() => FormValidation.emaiValidation(passwordController.text, "mail"),
                        controller: _assuranceController,
                        hintText: 'Assurance',
                        obscureText: false,
                        next: false,
                        width: 345,
                        padding: const EdgeInsets.only(top: 15, bottom: 35),

                        // validator: FormValidation.passwordValidation,
                      ),
                    ],
                  ),
                ),
                MyButton(
                  onTap: () {
                    Get.to(() => const HomePage(),
                        transition: Transition.rightToLeft);

                    Get.find<RegisterPageController>().setDoctorInfo(
                        speciality: _specialityController.text,
                        qualification: _qualificationController.text,
                        experience: _experienceController.text,
                        assurance: _assuranceController.text);
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
