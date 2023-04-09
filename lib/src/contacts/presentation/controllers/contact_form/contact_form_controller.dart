import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactFormController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final middleController = TextEditingController();
  final surname = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void onClose() {
    nameController.dispose();
    middleController.dispose();
    surname.dispose();
    phoneController.dispose();
    super.onClose();
  }

  String? validator(String value) {
    if (value.isEmpty) {
      return 'Это поле обязательно для заполнения';
    }
    return null;
  }

  Future<void> addContact() async {
    //...
  }
}
