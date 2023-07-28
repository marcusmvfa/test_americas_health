import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_americas_health/data/repository/api_cep_aberto/api_cep_aberto_repository_impl.dart';
import 'package:test_americas_health/domain/repositories/contact/contact_repository.dart';
import 'package:test_americas_health/domain/repositories/user/user_repository.dart';
import 'package:test_americas_health/model/address_model.dart';
import 'package:test_americas_health/model/city_model.dart';
import 'package:test_americas_health/model/contact_model.dart';
import 'package:test_americas_health/model/state_model.dart';

import '../../dependency_injection.dart';

class ContactController {
  final _contactRepository = getIt<ContactRepository>();
  final _userRepository = getIt<UserRepository>();

  var contactSelected = ContactModel();
  RxList<ContactModel> contacts = <ContactModel>[].obs;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final cepController = TextEditingController();
  final streetController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();

  Future saveContact() async {
    try {
      final user = await _userRepository.fetchCurrentUser();
      contactSelected.userId = user!.userId;
      contactSelected.name = nameController.text;
      contactSelected.phone = phoneController.text;
      contactSelected.address = AddressModel(
        cep: cepController.text,
        logradouro: streetController.text,
        cidade: CityModel(nome: cityController.text),
        estado: StateModel(stateController.text),
      );
      if (contactSelected.contactId != null) {
        await _contactRepository.editContact(contactSelected);
      } else {
        await _contactRepository.addContact(contactSelected);
      }
      await fetchContactList();
      return true;
    } on Exception catch (e) {
      return false;
    }
  }

  Future fetchContactList() async {
    final user = await _userRepository.fetchCurrentUser();
    final result = await _contactRepository.getContacts(user!.userId!);
    contacts.value = List.from(result);
  }

  Future deleteContact(String contactId) async {
    await _contactRepository.deleteContact(contactId);
  }

  Future getContactCEP() async {
    final result = await ApiCepAbertoRepositoryImpl().getCEP(cepController.text);
    setContactCEP(result);
  }

  setContactCEP(AddressModel address) {
    contactSelected.address = address;
    streetController.text = address.logradouro ?? "";
    cityController.text = address.cidade?.nome ?? "";
    stateController.text = address.estado?.sigla ?? "";
  }
}
