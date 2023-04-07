import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_farma/src/auth/presentation/controllers/auth/auth_controller.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          ListTile(
            leading: const Icon(Icons.logout_rounded),
            title: Text(
              'Выход',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onTap: () {
              final controller = Get.find<AuthController>();
              controller.logout();
            },
          ).paddingOnly(bottom: 24.0),
        ],
      ),
    );
  }
}
