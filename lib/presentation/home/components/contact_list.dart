import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:test_americas_health/dependency_injection.dart';
import 'package:test_americas_health/domain/controllers/contact_controller.dart';
import 'package:test_americas_health/model/contact_model.dart';
import 'package:test_americas_health/presentation/home/components/contact_list_item.dart';

class ContactList extends StatefulWidget {
  ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final _controller = getIt<ContactController>();
  @override
  void initState() {
    _controller.fetchContactList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.teal,
      edgeOffset: 10,
      onRefresh: () => _controller.fetchContactList(),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Center(
          child: Obx(
            () => _controller.contacts.isEmpty
                ? Container(
                    padding: const EdgeInsets.only(top: 16),
                    height: double.maxFinite,
                    child: const Text(
                      "Puxe para baixo para atualizar",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: _controller.contacts.length,
                    itemBuilder: (context, index) {
                      final contact = _controller.contacts[index];
                      return ContactListItem(
                        contact: contact,
                      );
                    }),
          ),
        ),
      ),
    );
  }
}
