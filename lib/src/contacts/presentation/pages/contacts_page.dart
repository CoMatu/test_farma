import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_farma/src/contacts/domain/entities/contact_entity.dart';
import 'package:test_farma/src/contacts/presentation/controllers/contacts_controllers/contact_controller.dart';
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
        child: const Icon(Icons.add),
        onPressed: onPressed,
      ),
    );
  }

  void onPressed() {}
}
