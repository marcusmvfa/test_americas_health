import 'package:flutter/material.dart';
import 'package:test_americas_health/domain/controllers/login_controller.dart';
import 'package:test_americas_health/dependency_injection.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final _controller = getIt<LoginController>();
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
              onPressed: () {
                _controller.loginUser();
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
              onTap: () {},
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
