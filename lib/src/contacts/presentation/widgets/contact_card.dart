import 'package:flutter/material.dart';
import 'package:flutter_multitool/flutter_multitool.dart';
import 'package:test_farma/src/contacts/domain/entities/contact_entity.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
    required this.contact,
  });

  final ContactEntity contact;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          const Icon(
            Icons.account_circle,
            color: Colors.blue,
            size: 48.0,
          ).paddingSymmetric(horizontal: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${contact.name} ${contact.surname}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text('phone: ${contact.phone}'),
              Wrap(
                children: List.generate(
                  contact.tags.length,
                  (index) => Chip(
                    shape: const StadiumBorder(),
                    label: Text(contact.tags[index]),
                  ).paddingOnly(right: 4.0),
                ),
              )
            ],
          ).expanded(),
          Icon(
            contact.favorite ? Icons.favorite : Icons.favorite_border,
            color: contact.favorite ? Colors.yellow : Colors.grey,
            size: 32.0,
          ).paddingAll(16.0),
        ],
      ).paddingSymmetric(vertical: 8.0),
    ).paddingSymmetric(horizontal: 8.0);
  }
}
