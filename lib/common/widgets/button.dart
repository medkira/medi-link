import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color? color;
  final GlobalKey? formKey;
  final double? width;
  final double? height;
  final double? fontSize;
  final Decoration? decoration;
  final TextStyle? textStyle;

  const MyButton({
    super.key,
    required this.onTap,
    required this.text,
    this.color,
    this.formKey,
    this.width,
    this.fontSize,
    this.decoration,
    this.textStyle,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: (width != null) ? width : 180,
        height: (height != null) ? height : 60,
        padding: const EdgeInsets.all(5),
        decoration: (decoration != null)
            ? decoration
            : BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: color,
              ),
        child: Center(
            child: Text(
          text,
          style: (textStyle != null)
              ? textStyle
              : TextStyle(
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