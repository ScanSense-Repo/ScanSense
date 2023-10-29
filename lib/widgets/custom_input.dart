import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scan_sense/common/styles.dart';

class CustomInput extends StatefulWidget {
  TextEditingController controller;
  bool isObscure = false;
  bool isPassword = false;
  String hint;
  CustomInput({
    required this.controller,
    required this.hint,
    this.isObscure = false,
    this.isPassword = false,
    super.key,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: inputBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        child: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hint,
            hintStyle: GoogleFonts.poppins(
              fontSize: 13,
              color: grayColor,
            ),
            suffixIcon: (widget.isPassword)
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        widget.isObscure = !widget.isObscure;
                      });
                    },
                    icon: Icon(
                      (widget.isObscure)
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined,
                      color: grayColor,
                    ),
                  )
                : null,
          ),
          obscureText: widget.isObscure,
        ),
      ),
    );
  }
}
