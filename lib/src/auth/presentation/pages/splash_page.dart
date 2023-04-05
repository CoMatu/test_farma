import 'package:flutter/material.dart';
import 'package:flutter_multitool/flutter_multitool.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: LoaderWidget(),
    );
  }
}
