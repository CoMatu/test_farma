import 'package:flutter/material.dart';

typedef OnPasswordCompleted = VoidCallback;

class PasswordInputWidget extends StatelessWidget {
  const PasswordInputWidget({
    Key? key,
    required this.controller,
    required this.onPasswordCompleted,
  }) : super(key: key);

  final TextEditingController controller;
  final OnPasswordCompleted onPasswordCompleted;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
