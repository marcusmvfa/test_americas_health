import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:test_americas_health/domain/controllers/user_controller.dart';
import 'package:test_americas_health/dependency_injection.dart';
import 'package:test_americas_health/presentation/home/home_view.dart';
import 'package:test_americas_health/presentation/sign_up/sign_up_view.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final _controller = getIt<UserController>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Campo obrigatório!";
                  }
                  if (!value.contains('@') || !value.contains('.com')) {
                    return "Insira um email válido";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _controller.passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Senha",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Campo obrigatório!";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(fixedSize: const Size(200, 45), backgroundColor: Colors.teal.shade400),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
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
      ),
    );
  }
}
