import 'package:flutter/material.dart';
import 'package:test_americas_health/model/contact_model.dart';

class ContactListItem extends StatelessWidget {
  const ContactListItem({required this.contact, super.key});
  final ContactModel contact;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        title: Text(contact.name!),
        subtitle: Text(contact.phone!),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.delete_outline,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
