import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medilink/common/widgets/button.dart';
import 'package:medilink/common/widgets/categories_scroller.dart';
import 'package:medilink/extensions/color.dart';
import 'package:medilink/features/Profile/model/medicalfolder_model.dart';

class PatientProfilePage extends StatelessWidget {
  const PatientProfilePage({super.key});

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
              expandedHeight: 380,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    Container(
                      color: Globals.typingColor,
                      height: 400,
                      child: DefaultTextStyle(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.roboto().fontFamily,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: 80),
                            const CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 146, 149, 151),
                              radius: 85,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(top: 25, bottom: 25),
                              child: const Text(
                                "Name Name",
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MyButton(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(),
                                    color: Globals.primaryColor,
                                  ),
                                  onTap: null,
                                  text: "Follow",
                                  textStyle: const TextStyle(
                                      color: Globals.scaffoldColor),
                                  width: 150,
                                ),
                                MyButton(
                                    height: 50,
                                    onTap: null,
                                    text: "Message",
                                    textStyle: const TextStyle(
                                        color: Globals.typingColor),
                                    decoration: BoxDecoration(
                                      color: Globals.scaffoldColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    width: 150)
                              ],
                            )
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
                    constraints: const BoxConstraints(
                      minHeight: 730.0,
                    ),
                    child: Container(
                      // height: MedicalFolderModel.items.length * 135 + 400,

                      decoration: const BoxDecoration(
                        color: Globals.scaffoldColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35.0),
                          topRight: Radius.circular(35.0),
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
                          Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: ExpendContainer(
                              closedContainer: Row(children: [
                                SizedBox(
                                  child: Image.asset(
                                    'assets/images/identification-card (1).png',
                                    width: 50,
                                    height: 50,
                                    color: Globals.scaffoldColor,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  "Tap to View Prsonal File",
                                  style: TextStyle(
                                      color: Globals.scaffoldColor,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400),
                                ),
                              ]),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: ExpendContainer(
                              expendHeight:
                                  MedicalFolderModel.items.length * 140,
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
                                  const Text(
                                    "Tap to View Medical File",
                                    style: TextStyle(
                                        color: Globals.scaffoldColor,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              openContainerHeader: Column(
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
                                      const Text(
                                        "Medical File",
                                        style: TextStyle(
                                            color: Globals.scaffoldColor,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              openContainer: ListView(
                                physics: const NeverScrollableScrollPhysics(),
                                children: const [
                                  CategoriesList(),
                                ],
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
                      ? 65
                      : 90
                  : isExpanded
                      ? (MediaQuery.of(context).size.height * 0.25)
                      : (widget.expendHeight != null)
                          ? widget.expendHeight
                          : 250,
              width: isExpanded ? 385 : 350,
              decoration: BoxDecoration(
                color: Globals.primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
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
                                : const Text(
                                    'Tap to View Patient Data',
                                    style: TextStyle(
                                        color: Globals.scaffoldColor,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w400),
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
                                : const Text(
                                    'Patient Information',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.w400),
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
