import 'package:flutter/material.dart';

class ContactDetailPage extends StatelessWidget {
  const ContactDetailPage({Key? key, required this.contactId})
      : super(key: key);

  final String contactId;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('User ID: $contactId'),
    );
  }
}
