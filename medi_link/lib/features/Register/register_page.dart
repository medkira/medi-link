import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medilink/common/button.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPgae extends StatefulWidget {
  final Function()? onTap;
  const RegisterPgae({super.key, required this.onTap});

  @override
  State<RegisterPgae> createState() => _RegisterPgaeState();
}

class _RegisterPgaeState extends State<RegisterPgae> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: BackButton(
            onPressed: widget.onTap,
            color: const Color(0xff1479FF),
          ),
        ),
        body: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 360,
              child: Image.asset(
                'assets/images/Doctor2.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 380,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(children: [
                          Text(
                            "Online appointment",
                            style: TextStyle(
                                color: const Color(0xff474d62),
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                fontFamily: GoogleFonts.mulish().fontFamily),
                          ),
                          const SizedBox(height: 25),
                          const Text(
                            "Select the specialist and make an  \n appointment through our app!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff9e9ea7),
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ]),
                        MyButton(
                          onTap: () {},
                          text: "Get Started",
                          color: const Color(0xff1479FF),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
