import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:test_americas_health/dependency_injection.dart';
import 'package:test_americas_health/domain/controllers/sign_up_controller.dart';
import 'package:test_americas_health/presentation/home/home_view.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  final _controller = getIt<SignUpController>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _controller.nameController,
                decoration: const InputDecoration(
                  hintText: "Nome completo",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _controller.emailController,
                decoration: const InputDecoration(
                  hintText: "E-mail",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _controller.phoneController,
                decoration: const InputDecoration(
                  hintText: "Telefone",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  } else if (value.length < 6) {
                    return 'Senha deve conter 6 caracteres no mínimo!';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                  controller: _controller.confirmPasswordController,
                  decoration: const InputDecoration(
                    hintText: "Confirmar senha",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    } else if (value != _controller.passwordController.text) {
                      return 'Senhas não coincidem!';
                    }
                    return null;
                  }),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final result = await _controller.createUser() as bool;

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: result ? Colors.green : Colors.red,
                        content: Text(
                          result ? "Usuário criado com sucesso!" : "Ocorreu um problema ao criar o usuário!",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                    if (result) {
                      Get.offAll(() => HomeView());
                    }
                  }
                },
                child: const Text(
                  "Entrar",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
