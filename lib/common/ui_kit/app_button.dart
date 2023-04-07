import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.isActive = true,
  });

  final VoidCallback onPressed;
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
          minHeight: 52.0, maxHeight: 52.0, minWidth: 300.0),
      child: ElevatedButton(
        onPressed: isActive ? () => onPressed() : null,
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
