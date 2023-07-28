import 'package:test_americas_health/model/contact_model.dart';

abstract class ContactRepository {
  Future<List<ContactModel>> getContacts(String userId);
  Future addContact(ContactModel contact);
  Future editContact(ContactModel contact);
  Future deleteContact(String contactId);
}
