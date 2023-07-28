// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:test_americas_health/model/address_model.dart';

class ContactModel {
  String? contactId;
  String? userId;
  String? name;
  String? phone;
  AddressModel? address;
  ContactModel({
    this.contactId,
    this.userId,
    this.name,
    this.phone,
    this.address,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'contactId': contactId,
      'userId': userId,
      'name': name,
      'phone': phone,
      'address': address?.toMap(),
    };
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      contactId: map['contactId'] != null ? map['contactId'] as String : null,
      userId: map['userId'] != null ? map['userId'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      address: map['address'] != null ? AddressModel.fromMap(map['address'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactModel.fromJson(String source) => ContactModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
