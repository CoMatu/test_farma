import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_farma/common/constants/constants.dart';
import 'package:test_farma/src/auth/presentation/controllers/sign_in/signin_controller.dart';
import 'package:test_farma/src/auth/presentation/controllers/sign_in/signin_state.dart';
import 'package:test_farma/src/auth/presentation/widgets/login_input_widget.dart';
import 'package:test_farma/src/auth/presentation/widgets/password_input_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController loginController;
  late final TextEditingController passwordController;

  late final SignInController signInController;

  @override
  void initState() {
    signInController = Get.find<SignInController>();
    loginController = TextEditingController(text: signInController.login)
      ..addListener(loginListener);
    passwordController = TextEditingController(text: signInController.password)
      ..addListener(passwordListener);
    super.initState();
  }

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: AnimatedSwitcher(
          duration: switcherDuration,
          child: signInController.state is InitialSignInState ||
                  signInController.state is LoginWaitSignInState ||
                  signInController.state is LoginCompletedSignInState
              ? LoginInputWidget(
                  controller: loginController,
                  onLoginCompleted: onLoginCompleted,
                  errorText: signInController.error,
                )
              : signInController.state is PasswordWaitSignInState ||
                      signInController.state is ProcessingSignInState ||
                      signInController.state is FailureSignInState
                  ? PasswordInputWidget(
                      controller: passwordController,
                      errorText: signInController.error,
                      onPasswordCompleted: onPasswordCompleted,
                      sendIsActive:
                          signInController.state is! ProcessingSignInState,
                      onBackPressed: () {
                        signInController.backToLogin();
                      },
                    )
                  : Container(),
        ),
      ),
    );
  }

  void onLoginCompleted() {
    signInController.onLoginCompleted();
  }

  void loginListener() {
    signInController.changeLogin(loginController.text);
  }

  void passwordListener() {
    signInController.changePassword(passwordController.text);
  }

  void onPasswordCompleted() {
    signInController.onPasswordCompleted();
  }
}
