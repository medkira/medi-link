import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medilink/common/button.dart';

class ConfirmAccountPage extends StatefulWidget {
  const ConfirmAccountPage({super.key});

  @override
  State<ConfirmAccountPage> createState() => _ConfirmAccountPagePageState();
}

class _ConfirmAccountPagePageState extends State<ConfirmAccountPage> {
  final _fieldOne = TextEditingController();
  final _fieldTwo = TextEditingController();
  final _fieldThree = TextEditingController();
  final _fieldFour = TextEditingController();
  String? _OTP;

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
                        "Confirm your account",
                        style: TextStyle(
                          color: const Color(0xff1c1e21),
                          fontSize: 24,
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "We sent a code via email? Enter that code to\nconfirm your account.",
                        style: TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontSize: 16,
                            color: const Color.fromARGB(255, 89, 88, 89)),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: 30, left: 30, right: 30, bottom: 10),
                  // padding: const EdgeInsets.only(
                  //     left: 15, right: 15, top: 25, bottom: 25),
                  width: MediaQuery.of(context).size.width,
                  height: 130,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(213, 212, 218, 1),
                    ),
                    borderRadius: BorderRadius.circular(18),
                    color: const Color.fromARGB(255, 244, 242, 242),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OtpInput(_fieldOne, true, true), // auto focus
                      OtpInput(_fieldTwo, false, true),
                      OtpInput(_fieldThree, false, true),
                      OtpInput(_fieldFour, false, false)
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: Text(
                    _OTP!.length < 4 ? 'Pleas enter OTP' : "",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 247, 106, 137),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                MyButton(
                  onTap: () {
                    setState(() {
                      _OTP = _fieldOne.text +
                          _fieldTwo.text +
                          _fieldThree.text +
                          _fieldFour.text;
                    });
                  },
                  text: "Continue",
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

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus, next;
  const OtpInput(
    this.controller,
    this.autoFocus,
    this.next, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: 55,
      child: TextField(
        textInputAction: next ? TextInputAction.next : TextInputAction.done,
        controller: controller,
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: const InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(100))),
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (next) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          }
        },
      ),
    );
  }
}
