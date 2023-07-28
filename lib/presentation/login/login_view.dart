import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:test_americas_health/domain/controllers/user_controller.dart';
import 'package:test_americas_health/dependency_injection.dart';
import 'package:test_americas_health/presentation/home/home_view.dart';
import 'package:test_americas_health/presentation/sign_up/sign_up_view.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final _controller = getIt<UserController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(
              size: 104,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _controller.emailController,
              decoration: const InputDecoration(
                hintText: "E-mail",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: _controller.passwordController,
              decoration: const InputDecoration(
                hintText: "Senha",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: () async {
                final result = await _controller.loginUser();
                if (result == true) {
                  Get.offAll(() => HomeView());
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        "Confira seus dados e tente novamente",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }
              },
              child: const Text(
                "Entrar",
                style: TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {
                Get.to(() => SignUpView());
              },
              child: const Text(
                "Não possui cadastro?\n Clique aqui para se cadastrar!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
