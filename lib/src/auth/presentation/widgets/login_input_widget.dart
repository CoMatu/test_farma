import 'package:flutter/material.dart';
import 'package:flutter_multitool/flutter_multitool.dart';
import 'package:test_farma/common/ui_kit/app_button.dart';
import 'package:test_farma/common/ui_kit/app_text_field.dart';

/// login input completed
typedef OnLoginCompleted = VoidCallback;

class LoginInputWidget extends StatelessWidget {
  const LoginInputWidget({
    Key? key,
    required this.controller,
    required this.onLoginCompleted,
    this.errorText,
  }) : super(key: key);
  final TextEditingController controller;
  final OnLoginCompleted onLoginCompleted;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.account_box,
          size: 120.0,
          color: Theme.of(context).primaryColor,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300.0),
              child: AppTextField(
                controller: controller,
                title: 'Укажите Ваш логин',
                suffixIcon: const Icon(Icons.login),
              ),
            ),
            if (errorText != null)
              Text(
                errorText!,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: Colors.red),
              ),
          ],
        ).paddingSymmetric(vertical: 24.0),
        AppButton(
          title: 'Далее',
          onPressed: onLoginCompleted,
        ),
      ],
    ).gestureDetector(onTap: () {
      // убираем фокус из текстового поля при нажатии в любое место экрана
      FocusScope.of(context).unfocus();
    });
  }
}
