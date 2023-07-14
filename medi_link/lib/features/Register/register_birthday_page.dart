import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medilink/common/button.dart';
import 'package:medilink/common/register_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:medilink/features/Register/register_gender_page.dart';

class RegisterBirthdayPage extends StatefulWidget {
  const RegisterBirthdayPage({super.key});

  @override
  State<RegisterBirthdayPage> createState() => _RegisterBirthdayPageState();
}

class _RegisterBirthdayPageState extends State<RegisterBirthdayPage> {
  final birthDayController = TextEditingController();
  final dateFormat = DateFormat('MMMM d, yyyy');

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Set date"),
          content: Container(
            decoration: const BoxDecoration(color: Colors.white),
            height: 190,
            width: 275,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime(2023, 1, 1),
              onDateTimeChanged: (DateTime newDateTime) {
                setState(() {
                  birthDayController.text = dateFormat.format(newDateTime);
                });
              },
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: TextButton(
                onPressed: () {
                  // Navigator.of(context).pop();
                  Get.back();
                },
                child: const Text(
                  "cancel",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  "Set",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                  padding: const EdgeInsets.only(right: 95, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "What's your birthday?",
                        style: TextStyle(
                          color: const Color(0xff1c1e21),
                          fontSize: 24,
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Choose your date of birth.",
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
                        controller: birthDayController,
                        hintText: 'birth date',
                        obscureText: false,
                        next: true,
                        width: 345,
                        onTap: () => openDialog(),
                        readOnly: true,
                      ),
                    ],
                  ),
                ),
                MyButton(
                  onTap: () {
                    Get.to(() => const RegisterGenderPage(),
                        transition: Transition.rightToLeft);
                  },
                  text: "Next",
                  color: const Color(0xff1479FF),
                  width: 345,
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
