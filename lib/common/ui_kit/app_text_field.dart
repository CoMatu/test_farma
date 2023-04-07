import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_multitool/flutter_multitool.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.title,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    this.titleTextStyle,
    this.onSubmitted,
    this.errorText,
    this.autofocus = false,
  }) : super(key: key);

  final String title;
  final String? hintText;
  final String? errorText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextStyle? titleTextStyle;
  final void Function(String)? onSubmitted;
  final TextEditingController? controller;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
        ).paddingOnly(bottom: 6.0),
        TextField(
          autofocus: autofocus,
          controller: controller,
          autocorrect: false,
          selectionHeightStyle: BoxHeightStyle.max,
          textAlignVertical: TextAlignVertical.center,
          cursorHeight: 20,
          keyboardType: keyboardType,
          onSubmitted: onSubmitted,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.only(
                top: 16.0, bottom: 16.0, left: 16.0, right: 16.0),
            hintText: hintText,
            suffixIcon: suffixIcon,
            suffixIconConstraints:
                const BoxConstraints(maxWidth: 48.0, minWidth: 48.0),
            errorStyle: const TextStyle(height: 0),
            errorText: errorText,
          ),
          obscureText: obscureText,
          obscuringCharacter: '\u002a',
        ),
      ],
    );
  }
}
