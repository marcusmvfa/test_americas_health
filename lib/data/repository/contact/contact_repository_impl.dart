import 'package:test_americas_health/domain/repositories/contact/contact_repository.dart';
import 'package:test_americas_health/model/contact_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactRepositoryImpl implements ContactRepository {
  late final CollectionReference _contactCollection;

  ContactRepositoryImpl() {
    _contactCollection = FirebaseFirestore.instance.collection('contacts');
  }

  @override
  Future addContact(ContactModel contact) async {
    final id = _contactCollection.doc().id;
    contact.contactId = id;
    await _contactCollection.doc(id).set(contact.toMap());
  }

  @override
  Future deleteContact(String contactId) async {
    await _contactCollection.doc(contactId).delete();
  }

  @override
  Future<List<ContactModel>> getContacts(String userId) async {
    final result = await _contactCollection.where('userId', isEqualTo: userId).get();
    final contacts = result.docs
        .map(
          (contact) => ContactModel.fromMap(contact.data() as Map<String, dynamic>),
        )
        .toList();
    return contacts;
  }

  @override
  Future editContact(ContactModel contact) async {
    await _contactCollection.doc(contact.contactId).set(contact.toMap());
  }
}
