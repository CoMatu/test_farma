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
    required this.onBackPressed,
    required this.sendIsActive,
    this.errorText,
  }) : super(key: key);

  final TextEditingController controller;
  final OnPasswordCompleted onPasswordCompleted;
  final String? errorText;
  final VoidCallback onBackPressed;
  final bool sendIsActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            BackButton(onPressed: onBackPressed).paddingOnly(top: 40.0),
            const SizedBox().expanded()
          ],
        ),
        const Spacer(),
        Icon(
          Icons.password_rounded,
          size: 80.0,
          color: Theme.of(context).primaryColor,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300.0),
              child: AppTextField(
                autofocus: true,
                controller: controller,
                title: 'Укажите Ваш пароль',
                suffixIcon: const Icon(Icons.password),
                obscureText: true,
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
        const Spacer(),
        if (!sendIsActive)
          const Center(
            child: CircularProgressIndicator(),
          ),
        const Spacer(),
        AppButton(
          title: 'Вход',
          isActive: sendIsActive,
          onPressed: onPasswordCompleted,
        ).paddingOnly(bottom: 24.0),
      ],
    ).gestureDetector(onTap: () {
      // убираем фокус из текстового поля при нажатии в любое место экрана
      FocusScope.of(context).unfocus();
    });
  }
}
