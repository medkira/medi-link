import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medilink/common/button.dart';

class RegisterTypedPage extends StatefulWidget {
  const RegisterTypedPage({super.key});

  @override
  State<RegisterTypedPage> createState() => _RegisterEmaiPagePageState();
}

class _RegisterEmaiPagePageState extends State<RegisterTypedPage> {
  final passwordController = TextEditingController();
  String typeText = "";
  int _isPressed = -1;
  void _handlePress(int index) {
    setState(() {
      _isPressed = index;
      typeText = types[index].type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        setState(() {
          _isPressed = -1;
          typeText = "";
        });
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
                  padding: const EdgeInsets.only(right: 50, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select Your Role",
                        style: TextStyle(
                          color: const Color(0xff1c1e21),
                          fontSize: 25,
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Join as a Doctor, Patient, Laboratory, or \n Pharmacy",
                        style: TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontSize: 16,
                            color: const Color.fromARGB(255, 89, 88, 89),
                            height: 1.25),
                      ),
                    ],
                  ),
                ),
                //i was will do like this :)  ez and fast but no my big
                //brain wanted to learn GridView yeh... it took my 3h  to do it... at least its  clean code now :') ...
                // Container(
                //   margin: const EdgeInsets.all(30),
                //   padding: const EdgeInsets.only(
                //       left: 15, right: 15, top: 25, bottom: 25),
                //   width: MediaQuery.of(context).size.width,
                //   decoration: BoxDecoration(
                //     border: Border.all(
                //       color: const Color.fromRGBO(213, 212, 218, 1),
                //     ),
                //     borderRadius: BorderRadius.circular(18),
                //     color: const Color.fromARGB(255, 244, 242, 242),
                //   ),
                //   child: Column(
                //     children: [
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //         children: [
                //           GestureDetector(
                //             onTap: _handlePress,
                //             child: Container(
                //               decoration: BoxDecoration(
                //                 border: Border.all(
                //                   width: 5,
                //                   strokeAlign: 0,
                //                   color: _isPressed
                //                       ? const Color(0xff1479FF)
                //                       : const Color.fromARGB(
                //                           255, 244, 242, 242),
                //                 ),
                //                 color: const Color.fromARGB(255, 104, 99, 99),
                //                 borderRadius: BorderRadius.circular(100),
                //               ),
                //               width: 110,
                //               height: 110,
                //             ),
                //           ),
                //           const SizedBox(width: 15),
                //           Container(
                //             decoration: BoxDecoration(
                //               color: const Color.fromARGB(255, 104, 99, 99),
                //               borderRadius: BorderRadius.circular(100),
                //             ),
                //             width: 110,
                //             height: 110,
                //           ),
                //         ],
                //       ),
                //       const SizedBox(height: 18),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //         children: [
                //           Container(
                //             decoration: BoxDecoration(
                //               color: const Color.fromARGB(255, 104, 99, 99),
                //               borderRadius: BorderRadius.circular(100),
                //             ),
                //             width: 110,
                //             height: 110,
                //           ),
                //           const SizedBox(width: 15),
                //           Container(
                //             decoration: BoxDecoration(
                //               color: const Color.fromARGB(255, 104, 99, 99),
                //               borderRadius: BorderRadius.circular(100),
                //             ),
                //             width: 110,
                //             height: 110,
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                Container(
                  margin: const EdgeInsets.all(30),
                  // padding: const EdgeInsets.only(
                  //     left: 15, right: 15, top: 25, bottom: 25),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 490,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(213, 212, 218, 1),
                    ),
                    borderRadius: BorderRadius.circular(18),
                    color: const Color.fromARGB(255, 244, 242, 242),
                  ),
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    children: types.asMap().entries.map((type) {
                      final int index = type.key;
                      return GestureDetector(
                        onTap: () => _handlePress(index),
                        child: Container(
                          margin: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 5,
                              strokeAlign: 0,
                              color: (_isPressed == index)
                                  ? const Color(0xff1479FF)
                                  : const Color.fromARGB(255, 244, 242, 242),
                            ),
                            color: const Color.fromARGB(255, 232, 232, 232),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          // width: 100, why this did work..?
                          // height: 100,
                          child: Container(
                            padding: const EdgeInsets.all(18),
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Image.asset(
                              type.value.img,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    height: 50,
                    child: Text(
                      typeText,
                      style: const TextStyle(
                        color: Color(0xff1479FF),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                MyButton(
                  onTap: () {
                    // Get.to();
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

class TypeList {
  final String type, img;

  TypeList(
    this.type,
    this.img,
  );
}

List<TypeList> types = [
  TypeList("doctor", 'assets/images/types_image/doctor.png'),
  TypeList("patient", 'assets/images/types_image/patient.png'),
  TypeList("laboratory", 'assets/images/types_image/laboratory.png'),
  TypeList("pharmacy", 'assets/images/types_image/pharmacy.png'),
];
