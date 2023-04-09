import 'package:flutter/material.dart';
import 'package:flutter_multitool/flutter_multitool.dart';
import 'package:test_farma/src/contacts/domain/entities/contact_entity.dart';

class ContactCard extends StatefulWidget {
  const ContactCard({
    super.key,
    required this.contact,
  });

  final ContactEntity contact;

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  bool favorite = false;

  @override
  void initState() {
    favorite = widget.contact.favorite;
    super.initState();
  }

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
                '${widget.contact.name} ${widget.contact.surname}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text('phone: ${widget.contact.phone}'),
              Wrap(
                children: List.generate(
                  widget.contact.tags.length,
                  (index) => Chip(
                    shape: const StadiumBorder(),
                    label: Text(widget.contact.tags[index]),
                  ).paddingOnly(right: 4.0),
                ),
              )
            ],
          ).expanded(),
          IconButton(
              onPressed: onPressed,
              icon: Icon(
                favorite ? Icons.favorite : Icons.favorite_border,
                color: favorite ? const Color(0xFFFF3BA3) : Colors.grey,
                size: 32.0,
              ).paddingAll(16.0)),
        ],
      ).paddingSymmetric(vertical: 8.0),
    ).paddingSymmetric(horizontal: 8.0);
  }

  void onPressed() {
    setState(() {
      favorite = !favorite;
      print(favorite);
    });
  }
}
