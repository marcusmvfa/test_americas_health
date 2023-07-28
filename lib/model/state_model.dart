// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StateModel {
  final String? sigla;

  StateModel(this.sigla);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sigla': sigla,
    };
  }

  factory StateModel.fromMap(Map<String, dynamic> map) {
    return StateModel(
      map['sigla'] != null ? map['sigla'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StateModel.fromJson(String source) => StateModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
