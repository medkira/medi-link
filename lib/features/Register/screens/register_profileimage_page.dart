import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medilink/common/widgets/button.dart';
import 'package:medilink/features/Register/controller/register_page_type_navigation_controller.dart';
import 'package:image_picker/image_picker.dart';
// import '../controller/register_page_controller.dart';
import 'dart:io';

class RegisterProfileImagePage extends StatefulWidget {
  const RegisterProfileImagePage({super.key});

  @override
  State<RegisterProfileImagePage> createState() =>
      _RegisterProfileImagePagePageState();
}

class _RegisterProfileImagePagePageState
    extends State<RegisterProfileImagePage> {
  File? _image;

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
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
                  padding: const EdgeInsets.only(right: 30, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Set Profile Image",
                        style: TextStyle(
                          color: const Color(0xff1c1e21),
                          fontSize: 25,
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Please select or provide your profile image.",
                        style: TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontSize: 16,
                            color: const Color.fromARGB(255, 89, 88, 89),
                            height: 1.25),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 21),
                  padding: const EdgeInsets.only(top: 25, bottom: 25),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(213, 212, 218, 1),
                    ),
                    borderRadius: BorderRadius.circular(18),
                    color: const Color.fromARGB(255, 244, 242, 242),
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color(0xff1479FF),
                        radius: 75,
                        backgroundImage:
                            _image != null ? FileImage(_image!) : null,
                      ),
                      const SizedBox(height: 60),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(width: 10),
                          MyButton(
                            onTap: () => _getImage(ImageSource.gallery),
                            text: 'Choose Image',
                            color: const Color(0xff1479FF),
                            width: 150,
                            fontSize: 17,
                          ),
                          const SizedBox(width: 10),
                          MyButton(
                            onTap: () => _getImage(ImageSource.camera),
                            text: 'Take Photo',
                            color: const Color(0xff1479FF),
                            width: 150,
                            fontSize: 17,
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                MyButton(
                  onTap: () {
                    final RegisterTypeNavigatioController nav =
                        Get.put(RegisterTypeNavigatioController());
                    nav.navigateRegisterType();
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
