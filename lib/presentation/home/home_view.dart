import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:test_americas_health/dependency_injection.dart';
import 'package:test_americas_health/domain/controllers/user_controller.dart';
import 'package:test_americas_health/presentation/contact_info/contact_info.dart';
import 'package:test_americas_health/presentation/home/components/contact_list.dart';
import 'package:test_americas_health/presentation/login/login_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final _userController = getIt<UserController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        title: const Text("Lista de Contatos"),
        actions: [
          IconButton(
            onPressed: () async {
              await _userController.logoutUser();
              Get.offAll(() => LoginView());
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ContactList(),
      ),
      floatingActionButton: Card(
        shape: const CircleBorder(),
        color: Colors.teal.shade400,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: IconButton(
            onPressed: () {
              Get.to(
                () => const ContactInfo(),
              );
            },
            icon: const Icon(
              Icons.person_add_outlined,
              color: Colors.white,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }
}
