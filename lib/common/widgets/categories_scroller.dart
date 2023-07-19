import 'package:flutter/material.dart';
import 'package:medilink/common/animation/opencontainer_animation.dart';
import 'package:medilink/extensions/color.dart';
import 'package:medilink/features/Profile/model/medicalfolder_model.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: MedicalFolderModel.items.map((data) {
        return Container(
          margin: const EdgeInsets.all(10),
          child: OpenContainerAnimation(
            color: Colors.white,
            raduisBorder: 18,
            widget: SizedBox(
              width: 350,
              height: 100,
              // padding: const EdgeInsets.all(50),
              child: Row(
                children: [
                  const SizedBox(width: 25),
                  SizedBox(
                    width: 50,
                    height: 50,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(50),
                    //   color: const Color.fromARGB(65, 126, 122, 122),
                    // ),
                    child: Image.asset(
                      data['image'],
                      color: Globals.primaryColor,
                    ),
                  ),
                  const SizedBox(width: 25),
                  Text(
                    data['name'],
                    style: const TextStyle(
                      fontSize: 22,
                      color: Globals.typingColor,
                    ),
                  ),
                ],
              ),
            ),
            navigateToWidget: const Text("hi"),
          ),
        );
      }).toList(),
    );
  }
}
