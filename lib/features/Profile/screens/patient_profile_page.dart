import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:medilink/common/widgets/button.dart';
import 'package:medilink/common/widgets/categories_scroller.dart';
import 'package:medilink/extensions/color.dart';
import 'package:medilink/features/Profile/model/medicalfolder_model.dart';
import 'package:medilink/features/Profile/model/quick_add_medicalfolder.dart';
import 'package:medilink/features/Profile/screens/settings_page.dart';

class PatientProfilePage extends StatelessWidget {
  const PatientProfilePage({super.key});
  final String username = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Globals.scaffoldColor,
      body: Container(
        color: Globals.typingColor,
        child: CustomScrollView(
          // physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Globals.typingColor,
              pinned: false,
              snap: false,
              floating: false,
              expandedHeight: 310,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    SizedBox(
                      height: 310,
                      child: DefaultTextStyle(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.nunitoSans().fontFamily,
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              top: 65,
                              right: 0,
                              child: GestureDetector(
                                onTap: () => Get.to(() => SettingsPage(),
                                    transition: Transition.rightToLeft),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Globals.lightBlueColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      )),
                                  padding: const EdgeInsets.only(right: 12),
                                  height: 45,
                                  width: 65,
                                  child: const Icon(
                                    Icons.settings,
                                    size: 35,
                                    color: Globals.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(height: 84),
                                const CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(255, 146, 149, 151),
                                  radius: 85,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 25),
                                  child: Text(
                                    username,
                                    style: const TextStyle(fontSize: 23),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              forceMaterialTransparency: false,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (BuildContext context, index) {
                  return ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height -
                          80, //the problem is this will look good only in the phone i debug on...
                    ),
                    child: Container(
                      // height: MedicalFolderModel.items.length * 135 + 400,

                      decoration: const BoxDecoration(
                        color: Globals.scaffoldColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(23.0),
                          topRight: Radius.circular(23.0),
                        ),
                      ),
                      // color: Color.fromRGBO(237, 236, 236, 1),
                      child: Column(
                        //this was list view
                        // physics: const ScrollPhysics(),
                        // padding: const EdgeInsets.all(0),
                        // scrollDirection: Axis.vertical,
                        children: [
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              const SizedBox(
                                width: 23,
                              ),
                              Text(
                                "Quick add",
                                style: TextStyle(
                                  fontFamily: GoogleFonts.aBeeZee().fontFamily,
                                  fontSize: 20,
                                  color: Globals.darkGreyColor,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 226, 241, 247),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              // padding: const EdgeInsets.only(right: 12),
                              // height: 100,
                              width: 350,
                              // width: MediaQuery.of(context).size.width,
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: QuickAddMedicalFolderModel.items
                                      .map((data) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 20),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            data['image'],
                                            color: Globals.primaryColor,
                                            height: 40,
                                            fit: BoxFit.contain,
                                          ),
                                          const SizedBox(height: 15),
                                          Text(
                                            data['name'],
                                            style: GoogleFonts.aBeeZee(
                                              color: Globals.darkGreyColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 11, top: 11),
                            child: ExpendContainer(
                              closedContainer: Row(
                                children: [
                                  SizedBox(
                                    child: Image.asset(
                                      'assets/images/identification-card (1).png',
                                      width: 50,
                                      height: 50,
                                      color: Globals.scaffoldColor,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "Tap to View Prsonal File",
                                    style: TextStyle(
                                      color: Globals.scaffoldColor,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                      fontFamily:
                                          GoogleFonts.nunitoSans().fontFamily,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: ExpendContainer(
                              expendHeight:
                                  MedicalFolderModel.items.length * 134,
                              closedContainer: Row(
                                children: [
                                  SizedBox(
                                    child: Image.asset(
                                      'assets/images/medical-folder.png',
                                      width: 50,
                                      height: 50,
                                      color: Globals.scaffoldColor,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "Tap to View Medical File",
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.nunitoSans().fontFamily,
                                      color: Globals.scaffoldColor,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              openContainerHeader: Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          child: Image.asset(
                                            'assets/images/medical-folder.png',
                                            width: 50,
                                            height: 50,
                                            color: Globals.scaffoldColor,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          "Medical File",
                                          style: TextStyle(
                                            color: Globals.scaffoldColor,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: GoogleFonts.nunitoSans()
                                                .fontFamily,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              openContainer: const SingleChildScrollView(
                                physics: NeverScrollableScrollPhysics(),
                                child: CategoriesList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpendContainer extends StatefulWidget {
  final Widget? closedContainer;
  final Widget? openContainer;
  final Widget? openContainerHeader;
  final double? expendHeight;

  const ExpendContainer(
      {super.key,
      this.closedContainer,
      this.openContainer,
      this.openContainerHeader,
      this.expendHeight});

  @override
  State<ExpendContainer> createState() => _ExpendContainerState();
}

class _ExpendContainerState extends State<ExpendContainer> {
  bool isTapped = true;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
              // height: 10,
              ),
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              setState(() {
                isTapped = !isTapped;
              });
            },
            onHighlightChanged: (value) {
              setState(() {
                isExpanded = value;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 1100),
              curve: Curves.fastLinearToSlowEaseIn,
              height: isTapped
                  ? isExpanded
                      ? 95
                      : 90
                  : isExpanded
                      ? (MediaQuery.of(context).size.height * 0.25)
                      : (widget.expendHeight != null)
                          ? widget.expendHeight
                          : 250,
              width: isExpanded ? 360 : 350,
              decoration: BoxDecoration(
                color: Globals.primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(11)),
                boxShadow: [
                  BoxShadow(
                    color: Globals.primaryColor.withOpacity(0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: isTapped
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            (widget.closedContainer != null)
                                ? widget.closedContainer!
                                : Text(
                                    'Tap to View Patient Data',
                                    style: TextStyle(
                                        color: Globals.scaffoldColor,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: GoogleFonts.nunitoSans()
                                            .fontFamily),
                                  ),
                            Icon(
                              isTapped
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_up,
                              color: Colors.white,
                              size: 27,
                            ),
                          ],
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 28),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            (widget.openContainerHeader != null)
                                ? widget.openContainerHeader!
                                : Text(
                                    'Patient Information',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w400,
                                      fontFamily:
                                          GoogleFonts.nunitoSans().fontFamily,
                                    ),
                                  ),
                            Icon(
                              isTapped
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_up,
                              color: Colors.white,
                              size: 27,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Expanded(
                          child: (widget.openContainer != null)
                              ? (widget.openContainer!)
                              : Text(
                                  isTapped
                                      ? ''
                                      : 'Address: Sousse \n'
                                          'Phone Number: 53648201 \n'
                                          'Gender: Male \n'
                                          'Birthdate: 1999-07-14 \n',
                                  style: TextStyle(
                                    height: 1.8,
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    fontFamily:
                                        GoogleFonts.nunitoSans().fontFamily,
                                  ),
                                ),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
