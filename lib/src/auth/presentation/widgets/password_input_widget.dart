import 'package:flutter/material.dart';
import 'package:flutter_multitool/flutter_multitool.dart';
import 'package:test_farma/common/ui_kit/app_button.dart';
import 'package:test_farma/common/ui_kit/app_text_field.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300.0),
          child: AppTextField(
            controller: controller,
            title: 'Укажите Ваш пароль',
            suffixIcon: const Icon(Icons.login),
          ),
        ).paddingSymmetric(vertical: 24.0),
        AppButton(
          title: 'Вход',
          onPressed: onPasswordCompleted,
        ),
      ],
    );
  }
}
