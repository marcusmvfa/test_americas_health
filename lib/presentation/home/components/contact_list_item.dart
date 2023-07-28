import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:test_americas_health/dependency_injection.dart';
import 'package:test_americas_health/domain/controllers/contact_controller.dart';
import 'package:test_americas_health/model/contact_model.dart';
import 'package:test_americas_health/presentation/contact_info/contact_info.dart';

class ContactListItem extends StatelessWidget {
  ContactListItem({required this.contact, super.key});
  final ContactModel contact;
  final _controller = getIt<ContactController>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ContactInfo(contact: contact));
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 8),
        elevation: 2,
        child: ListTile(
          contentPadding: const EdgeInsets.all(8),
          title: Text(contact.name!),
          subtitle: Text(contact.phone!),
          trailing: IconButton(
            onPressed: () async {
              await _controller.deleteContact(contact.contactId!);
              await _controller.fetchContactList();
            },
            icon: const Icon(
              Icons.delete_outline,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
