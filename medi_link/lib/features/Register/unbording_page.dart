import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medilink/common/button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medilink/features/Register/content_model.dart';
import 'package:medilink/features/Register/register_name_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class UnbordingPage extends StatefulWidget {
  const UnbordingPage({super.key});

  @override
  State<UnbordingPage> createState() => _UnbordingPageState();
}

class _UnbordingPageState extends State<UnbordingPage> {
  final _controller = PageController(initialPage: 0);
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const BackButton(
            color: Color.fromARGB(255, 37, 129, 249),
          ),
        ),
        body: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 360,
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 360,
                    child: Image.asset(
                      contents[i].image,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 380,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              contents[_currentIndex].title,
                              style: TextStyle(
                                  color: const Color(0xff474d62),
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: GoogleFonts.mulish().fontFamily),
                            ),
                            const SizedBox(height: 25),
                            Text(
                              contents[_currentIndex].discruption,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xff9e9ea7),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SmoothPageIndicator(
                          controller: _controller,
                          count: 3,
                          effect: const WormEffect(
                            activeDotColor: Color(0xff1479FF),
                          ),
                        ),
                        MyButton(
                          onTap: () {
                            // print(_controller.);
                            _controller.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.ease);
                            if (_currentIndex == contents.length - 1) {
                              Get.to(() => const RegisNameterPage(),
                                  transition: Transition.rightToLeft);
                            }
                          },
                          text: (_currentIndex == contents.length - 1)
                              ? "Get Started"
                              : "Next",
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
