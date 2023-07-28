import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CityModel {
  int? ddd;
  String? ibge;
  String? nome;
  CityModel({
    this.ddd,
    this.ibge,
    this.nome,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ddd': ddd,
      'ibge': ibge,
      'nome': nome,
    };
  }

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      ddd: map['ddd'] != null ? map['ddd'] as int : null,
      ibge: map['ibge'] != null ? map['ibge'] as String : null,
      nome: map['nome'] != null ? map['nome'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CityModel.fromJson(String source) => CityModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
