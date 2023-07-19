import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medilink/features/Forget%20Password/find_account_page.dart';
import 'package:medilink/features/Profile/screens/patient_profile_page.dart';
import 'package:medilink/features/Login/controller/login_page_controller.dart';
import '../../../common/widgets/button.dart';
import '../../../common/widgets/text_field.dart';
import '../../Register/screens/unbording/unbording_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginPageController _loginController = Get.put(LoginPageController());

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xfff2f2f2),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //       image: AssetImage("assets/images/backroundHealthcare.jpg"),
            //       fit: BoxFit.cover),
            // ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   'assets/images/medilink-high-resolution-logo-color-on-transparent-background.png',
                  //   height: 190,
                  //   width: 190,
                  // ),
                  const SizedBox(
                    width: 330,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sign in",
                          style: TextStyle(
                            color: Color.fromARGB(255, 57, 56, 56),
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Please fill the input below here",
                          style: TextStyle(
                            color: Color.fromARGB(255, 89, 88, 89),
                            fontSize: 15.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  Form(
                      key: formKey,
                      child: Column(
                        children: [
                          MyTextfield(
                            controller: emailTextController,
                            hintText: 'Email',
                            obscureText: false,
                            icon: const Icon(Icons.mail),
                            next: true,
                          ),
                          //password textfield
                          MyTextfield(
                            controller: passwordTextController,
                            hintText: 'Password',
                            obscureText: true,
                            icon: const Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            next: false,
                          ),
                        ],
                      )),

                  Container(
                    height: 30,
                    color: const Color(0xfff2f2f2),
                    margin: const EdgeInsets.only(left: 220),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => const FindAccountPage());
                      },
                      child: const Text(
                        "Forgot password?",
                        style: TextStyle(
                            color: Color.fromARGB(255, 77, 152, 251),
                            fontWeight: FontWeight.bold,
                            fontSize: 14.5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  //sign in button
                  Padding(
                    padding: const EdgeInsets.only(left: 17, right: 17),
                    child: MyButton(
                      width: double.infinity,
                      color: const Color.fromARGB(255, 77, 152, 251),
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          _loginController.setEmail(emailTextController.text);
                          _loginController
                              .setPassword(passwordTextController.text);
                          _loginController.login();
                        }
                      },
                      text: 'Log In',
                      formKey: formKey,
                    ),
                  ),
                  const SizedBox(height: 25),
                  //go to register page
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // UnbordingPage
                          Get.to(
                            () => PatientProfilePage(),
                            transition: Transition.rightToLeft,
                            duration: const Duration(milliseconds: 250),
                          );
                        },
                        child: Container(
                          color: const Color(0xfff2f2f2),
                          padding: const EdgeInsets.only(bottom: 30),
                          child: const Row(
                            children: [
                              Text(
                                "Not a member?",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 114, 114, 114)),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Resgister now",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 77, 152, 251),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
