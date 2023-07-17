import 'package:flutter/material.dart';

class MyTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final bool next;
  final double? width;
  final Function? onTap;
  final bool readOnly;
  final String? Function(String?, String)? validator;
  final EdgeInsets? padding;
  final TextInputType? keyboardType;

  const MyTextfield({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.next,
    this.validator,
    this.width,
    this.onTap,
    this.readOnly = false,
    this.padding,
    this.keyboardType,
  }) : super(key: key);

  @override
  State<MyTextfield> createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
  bool _isfill = false;
  bool _showText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      padding: (widget.padding != null)
          ? widget.padding
          : const EdgeInsets.only(top: 20, bottom: 25),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        readOnly: widget.readOnly,
        validator: (String? value) =>
            widget.validator?.call(value, widget.hintText),
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
          widget.onTap?.call();
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
          fontSize: 19,
          color: Color.fromARGB(255, 27, 27, 27),
        ),
        decoration: InputDecoration(
          labelText: widget.hintText,
          // labelStyle: TextStyle(color: const Color(0xff1479FF)),
          fillColor: _isfill
              ? const Color.fromARGB(255, 244, 242, 242)
              : const Color.fromARGB(255, 244, 242, 242),
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromRGBO(176, 173, 185, 1)),
            borderRadius: BorderRadius.circular(17),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17),
            borderSide: const BorderSide(color: Color.fromRGBO(39, 36, 49, 1)),
          ),
          filled: true,
          // hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 89, 88, 89),
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
                      icon: const Icon(Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _showText = !_showText;
                        });
                      },
                    )
                  : IconButton(
                      icon: const Icon(Icons.visibility_off),
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
