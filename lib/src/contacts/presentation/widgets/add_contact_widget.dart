import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_farma/common/ui_kit/app_button.dart';
import 'package:test_farma/common/ui_kit/app_text_field.dart';
import 'package:test_farma/src/contacts/presentation/controllers/contact_form/contact_form_controller.dart';

class AddContactWidget extends StatelessWidget {
  const AddContactWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _ModalTitleComponent()
            .paddingSymmetric(vertical: 16.0, horizontal: 16.0),
        const Divider(height: 0.0),
        const _ContactForm(),
      ],
    );
  }
}

/// Верхняя панель приложения
class _ModalTitleComponent extends StatelessWidget {
  const _ModalTitleComponent();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Добавить контакт',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close))
      ],
    );
  }
}

/// Форма добавления контакта
class _ContactForm extends GetView<ContactFormController> {
  const _ContactForm();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppTextField(
              title: 'Укажите Ваше имя',
              controller: controller.nameController,
              errorText: controller.validator(controller.nameController.text),
            ).paddingOnly(bottom: 8.0),
            AppTextField(
              title: 'Укажите Ваше отчество (необязательно)',
              controller: controller.middleController,
              errorText: controller.validator(controller.middleController.text),
            ).paddingOnly(bottom: 8.0),
            AppTextField(
              title: 'Укажите Вашу фамилию',
              controller: controller.surname,
              errorText: controller.validator(controller.surname.text),
            ).paddingOnly(bottom: 8.0),
            AppButton(onPressed: onPressed, title: 'Сохранить')
          ],
        ).paddingAll(8.0),
      ),
    );
  }

  void onPressed() {}
}
