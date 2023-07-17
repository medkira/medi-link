import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medilink/common/button.dart';
import 'package:medilink/common/register_text_field.dart';
import 'package:medilink/features/Home/home_page.dart';
import 'package:medilink/features/Register/controller/register_page_controller.dart';

class RegisterHealthMetricsPage extends StatefulWidget {
  const RegisterHealthMetricsPage({super.key});

  @override
  State<RegisterHealthMetricsPage> createState() =>
      _RegisterHealthMetricPagePageState();
}

class _RegisterHealthMetricPagePageState
    extends State<RegisterHealthMetricsPage> {
  final _bloodTypeController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _allergiesController = TextEditingController();
  List<String> allergies = [];
  final formKey = GlobalKey<FormState>();
  void _saveAllergies() {
    final inputAllergies = _allergiesController.text;

    allergies = inputAllergies.split(RegExp(r'\s+'));
  }

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
                        "Personal Health Information",
                        style: TextStyle(
                          color: const Color(0xff1c1e21),
                          fontSize: 25,
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Please fill in your personal health information.",
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
                        controller: _bloodTypeController,
                        hintText: 'Blood Type',
                        obscureText: false,
                        next: true,
                        width: 345,
                        padding: const EdgeInsets.only(top: 25, bottom: 10),
                        // validator: FormValidation.passwordValidation,
                      ),
                      MyTextfield(
                        // validator:() => FormValidation.emaiValidation(passwordController.text, "mail"),
                        controller: _heightController,
                        hintText: 'Height (cm)',
                        obscureText: false,
                        next: true,
                        width: 345,
                        padding: const EdgeInsets.only(top: 15, bottom: 10),

                        // validator: FormValidation.passwordValidation,
                      ),
                      MyTextfield(
                        // validator:() => FormValidation.emaiValidation(passwordController.text, "mail"),
                        controller: _weightController,
                        hintText: 'Weight (kg)',
                        obscureText: false,
                        next: true,
                        width: 345,
                        padding: const EdgeInsets.only(top: 15, bottom: 10),

                        // validator: FormValidation.passwordValidation,
                      ),
                      MyTextfield(
                        // validator:() => FormValidation.emaiValidation(passwordController.text, "mail"),
                        controller: _allergiesController,
                        hintText: 'Allgeries',
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
                    _saveAllergies();
                    Get.find<RegisterPageController>().setHealthMetrics(
                        bloodType: _bloodTypeController.text,
                        height: _heightController.text,
                        weight: _weightController.text);
                    Get.find<RegisterPageController>().registerPatient();
                    // print(allergies);
                    // Get.to(() => const HomePage(),
                    //     transition: Transition.rightToLeft);
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
