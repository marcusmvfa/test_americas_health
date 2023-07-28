import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/route_manager.dart';
import 'package:test_americas_health/data/repository/api_cep_aberto/api_cep_aberto_repository_impl.dart';
import 'package:test_americas_health/dependency_injection.dart';
import 'package:test_americas_health/domain/controllers/contact_controller.dart';
import 'package:test_americas_health/model/contact_model.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({this.contact, super.key});
  final ContactModel? contact;
  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  final _controller = getIt<ContactController>();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _controller.contactSelected = widget.contact ?? ContactModel();
    _controller.nameController.text = _controller.contactSelected.name ?? "";
    _controller.phoneController.text = _controller.contactSelected.phone ?? "";

    _controller.cepController.text = _controller.contactSelected.address?.cep ?? "";
    _controller.streetController.text = _controller.contactSelected.address?.logradouro ?? "";

    _controller.cityController.text = _controller.contactSelected.address?.cidade?.nome ?? "";
    _controller.stateController.text = _controller.contactSelected.address?.estado?.sigla ?? "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes do contato"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
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
                controller: _controller.cepController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () async {
                        await _controller.getContactCEP();
                      },
                      icon: const Icon(Icons.download)),
                  hintText: "CEP",
                  border: const OutlineInputBorder(),
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
                controller: _controller.streetController,
                decoration: const InputDecoration(
                  hintText: "Senha",
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
                  controller: _controller.cityController,
                  decoration: const InputDecoration(
                    hintText: "Cidade",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  }),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                  controller: _controller.stateController,
                  decoration: const InputDecoration(
                    hintText: "Estado",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  }),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final result = await _controller.createContact() as bool;

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: result ? Colors.green : Colors.red,
                        content: const Text(
                          "Contato salvo!",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                    if (result) {
                      Get.back();
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
