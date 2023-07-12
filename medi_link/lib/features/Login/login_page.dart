import 'package:flutter/material.dart';
import '../../common/button.dart';
import '../../common/text_field.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
        body: SingleChildScrollView(
          child: Container(
            color: const Color(0xfff2f2f2),
            height: MediaQuery.of(context).size.height,
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //       image: AssetImage("assets/images/backroundHealthcare.jpg"),
            //       fit: BoxFit.cover),
            // ),
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  // welcome back message
                  Image.asset(
                    'assets/images/logo-medilink.png',
                    height: 190,
                    width: 190,
                  ),

                  const SizedBox(
                    width: 310,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sign in",
                          style: TextStyle(
                            color: Color.fromARGB(255, 57, 56, 56),
                            fontSize: 30,
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
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 35),

                  Form(
                      key: formKey,
                      child: Column(
                        children: [
                          MyTextfield(
                            controller: emailTextController,
                            hintText: 'email',
                            obscureText: false,
                            icon: const Icon(Icons.mail),
                            next: true,
                          ),
                          const SizedBox(height: 15),
                          //password textfield
                          MyTextfield(
                            controller: passwordTextController,
                            hintText: 'password',
                            obscureText: true,
                            icon: const Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            next: false,
                          ),
                        ],
                      )),
                  //email textfield
                  Container(
                    padding: const EdgeInsets.only(left: 260),
                    child: GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Forgot?",
                        style: TextStyle(
                            color: Color(0xff1479FF),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 55),

                  //sign in button
                  MyButton(
                    color: const Color(0xff1479FF),
                    onTap: () {
                      if (formKey.currentState!.validate()) {}
                    },
                    text: 'Log In',
                    formKey: formKey,
                  ),

                  //go to register page
                  Padding(
                    padding: const EdgeInsets.only(top: 27.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Not a member?",
                          style: TextStyle(
                              color: Color.fromARGB(255, 114, 114, 114)),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            "Resgister now",
                            style: TextStyle(
                              color: Color(0xff1479FF),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
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
