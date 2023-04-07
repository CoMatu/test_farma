import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onLoginCompleted,
    required this.title,
  });

  final VoidCallback onLoginCompleted;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
          minHeight: 52.0, maxHeight: 52.0, minWidth: 200.0),
      child: ElevatedButton(
        onPressed: onLoginCompleted,
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
