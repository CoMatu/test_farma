import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_farma/common/ui_kit/app_button.dart';
import 'package:test_farma/common/ui_kit/app_text_field.dart';

/// login input completed
typedef OnLoginCompleted = VoidCallback;

class LoginInputWidget extends StatelessWidget {
  const LoginInputWidget({
    Key? key,
    required this.controller,
    required this.onLoginCompleted,
  }) : super(key: key);
  final TextEditingController controller;
  final OnLoginCompleted onLoginCompleted;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300.0),
          child: AppTextField(
            controller: controller,
            title: 'Укажите Ваш логин',
            suffixIcon: const Icon(Icons.login),
          ),
        ).paddingSymmetric(vertical: 24.0),
        AppButton(
          title: 'Далее',
          onPressed: onLoginCompleted,
        ),
      ],
    );
  }
}
