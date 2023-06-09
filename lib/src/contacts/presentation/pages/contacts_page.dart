import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_farma/src/contacts/presentation/controllers/contact_form/contact_form_controller.dart';
import 'package:test_farma/src/contacts/presentation/controllers/contacts_controllers/contact_controller.dart';
import 'package:test_farma/src/contacts/presentation/widgets/add_contact_widget.dart';
import 'package:test_farma/src/contacts/presentation/widgets/contact_card.dart';

class ContactsPage extends GetView<ContactsController> {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        log(controller.state.contacts.toString());
        final contacts = controller.state.contacts;

        return CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text('Контакты'),
              centerTitle: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => ContactCard(contact: contacts[index]),
                  childCount: controller.state.contacts.length),
            )
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addContact(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void addContact(BuildContext context) {
    Get.put(ContactFormController());
    showModalBottomSheet(
      context: context,
      builder: (context) => const AddContactWidget(),
    );
  }
}
