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
        backgroundColor: Colors.teal.shade400,
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
                decoration: InputDecoration(
                  hintText: "Nome completo",
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal.shade400),
                  ),
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
                decoration: InputDecoration(
                  hintText: "E-mail",
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal.shade400),
                  ),
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
                decoration: InputDecoration(
                  hintText: "Telefone",
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal.shade400),
                  ),
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
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Senha",
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal.shade400),
                  ),
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
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Confirmar senha",
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal.shade400),
                    ),
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
                style: ElevatedButton.styleFrom(fixedSize: const Size(200, 45), backgroundColor: Colors.teal.shade400),
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
