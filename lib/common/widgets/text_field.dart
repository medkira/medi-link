import 'package:flutter/material.dart';

import '../../utils/form_validation.dart';

class MyTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final bool next;
  final Icon icon;

  const MyTextfield({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.icon,
    required this.next,
  }) : super(key: key);

  @override
  State<MyTextfield> createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
  bool _isfill = false;
  bool _showText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17.0, right: 17, bottom: 15),
      child: TextFormField(
        validator: widget.obscureText
            ? (String? value) =>
                FormValidation.passwordValidation(value, widget.hintText)
            : (String? value) =>
                FormValidation.emaiValidation(value, widget.hintText),
        onChanged: (val) {
          setState(() {
            if (_isfill == false) {
              _isfill = true;
            }
          });
        },
        textInputAction:
            widget.next ? TextInputAction.next : TextInputAction.done,
        obscureText: (widget.obscureText && _showText),
        controller: widget.controller,
        onTap: () {
          setState(() {
            if (_isfill == false) {
              _isfill = true;
            }
          });
        },
        onTapOutside: (event) {
          setState(() {
            if (widget.controller.text != "") {
              _isfill = true;
            } else if (_isfill == true) {
              _isfill = !_isfill;
            }
          });
        },
        style: const TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 27, 27, 27),
        ),
        decoration: InputDecoration(
          // errorText: "wrong pass",

          fillColor: _isfill
              ? const Color.fromARGB(255, 244, 242, 242)
              : const Color.fromARGB(255, 244, 242, 242),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color.fromRGBO(39, 36, 49, 1)),
            borderRadius: BorderRadius.circular(17),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17),
            borderSide: const BorderSide(color: Color.fromRGBO(39, 36, 49, 1)),
          ),
          filled: true,
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 89, 88, 89),
          ),
          prefixIcon: Icon(
            widget.icon.icon,
            color: _isfill
                ? const Color.fromARGB(255, 146, 143, 146)
                : const Color.fromARGB(255, 89, 88, 89),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(17),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(17),
          ),
          suffixIcon: widget.obscureText
              ? (_showText
                  ? IconButton(
                      icon: const Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _showText = !_showText;
                        });
                      },
                    )
                  : IconButton(
                      icon: const Icon(Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _showText = !_showText;
                        });
                      },
                    ))
              : null,
        ),
      ),
    );
  }
}
