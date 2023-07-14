import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medilink/features/Register/register_email_page.dart';

import '../../common/button.dart';

class RegisterGenderPage extends StatefulWidget {
  const RegisterGenderPage({super.key});

  @override
  State<RegisterGenderPage> createState() => _RegisterGenderPagePageState();
}

class _RegisterGenderPagePageState extends State<RegisterGenderPage> {
  final formKey = GlobalKey<FormState>();
  bool _isMaleChecked = false;
  bool _isFemaleChecked = false;

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 110, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "What's your gender?",
                        style: TextStyle(
                          color: const Color(0xff1c1e21),
                          fontSize: 24,
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Enter your gender.",
                        style: TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontSize: 16,
                            color: const Color.fromARGB(255, 89, 88, 89)),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(25),
                  padding: const EdgeInsets.only(
                      top: 10, right: 12, left: 18, bottom: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(213, 212, 218, 1),
                    ),
                    borderRadius: BorderRadius.circular(18),
                    color: const Color.fromARGB(255, 244, 242, 242),
                  ),
                  width: MediaQuery.of(context).size.width - 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isMaleChecked = !_isMaleChecked;
                            _isFemaleChecked = false;
                          });
                        },
                        child: Container(
                          color: const Color.fromARGB(255, 244, 242, 242),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Male",
                                style: TextStyle(
                                  fontFamily: GoogleFonts.roboto().fontFamily,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Transform.scale(
                                scale: 1.2,
                                child: Checkbox(
                                  activeColor: const Color(0xff1479FF),
                                  value: _isMaleChecked,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      _isMaleChecked = newValue ?? false;
                                      _isFemaleChecked = false;
                                    });
                                  },
                                  shape: const CircleBorder(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isFemaleChecked = !_isFemaleChecked;
                            _isMaleChecked = false;
                          });
                        },
                        child: Container(
                          color: const Color.fromARGB(255, 244, 242, 242),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Female",
                                style: TextStyle(
                                  fontFamily: GoogleFonts.roboto().fontFamily,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Transform.scale(
                                scale: 1.2,
                                child: Checkbox(
                                  activeColor: const Color(0xff1479FF),
                                  value: _isFemaleChecked,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      _isFemaleChecked = newValue ?? false;
                                      _isMaleChecked = false;
                                    });
                                  },
                                  shape: const CircleBorder(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                MyButton(
                  onTap: () {
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
      ),
    );
  }
}
