// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:test_americas_health/model/city_model.dart';
import 'package:test_americas_health/model/state_model.dart';

class AddressModel {
  String? cep;
  String? logradouro;
  String? bairro;
  String? complemento;
  CityModel? cidade;
  StateModel? estado;
  AddressModel({
    this.cep,
    this.logradouro,
    this.bairro,
    this.complemento,
    this.cidade,
    this.estado,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cep': cep,
      'logradouro': logradouro,
      'bairro': bairro,
      'complemento': complemento,
      'cidade': cidade?.toMap(),
      'estado': estado?.toMap(),
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      cep: map['cep'] != null ? map['cep'] as String : null,
      logradouro: map['logradouro'] != null ? map['logradouro'] as String : null,
      bairro: map['bairro'] != null ? map['bairro'] as String : null,
      complemento: map['complemento'] != null ? map['complemento'] as String : null,
      cidade: map['cidade'] != null ? CityModel.fromMap(map['cidade'] as Map<String, dynamic>) : null,
      estado: map['estado'] != null ? StateModel.fromMap(map['estado'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) => AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
