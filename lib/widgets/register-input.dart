import 'package:flutter/material.dart';
import 'package:argon_flutter/constants/Theme.dart';

class RegisterInput extends StatelessWidget {
  final String placeholder;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final Function onTap;
  final Function onChanged;
  final TextEditingController controller;
  final bool autofocus;
  final Color borderColor;
  final bool obscureText;

  RegisterInput(
      {this.placeholder,
        this.suffixIcon,
        this.prefixIcon,
        this.onTap,
        this.onChanged,
        this.autofocus = false,
        this.borderColor = MyTheme.border,
        this.controller,
        this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: obscureText,
        cursorColor: MyTheme.muted,
        onTap: onTap,
        onChanged: onChanged,
        controller: controller,
        autofocus: autofocus,
        style: TextStyle(height: 0.85, fontSize: 14.0, color: MyTheme.initial),
        textAlignVertical: TextAlignVertical(y: 0.6),
        decoration: InputDecoration(
            filled: true,
            fillColor: MyTheme.white,
            hintStyle: TextStyle(
              color: MyTheme.muted,
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide(
                    color: borderColor, width: 1.0, style: BorderStyle.solid)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide(
                    color: borderColor, width: 1.0, style: BorderStyle.solid)),
            hintText: placeholder));
  }
}