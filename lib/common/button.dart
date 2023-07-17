import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color color;
  final GlobalKey? formKey;
  final double? width;
  final double? fontSize;

  const MyButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.color,
    this.formKey,
    this.width,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: (width != null) ? width : 180,
        height: 60,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color,
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: (fontSize != null) ? fontSize : 18,
            fontWeight: FontWeight.w500,
          ),
        )),
      ),
    );
  }
}
//  Color.fromARGB(22, 0, 70, 135),