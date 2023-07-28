import 'package:dio/dio.dart';
import 'package:test_americas_health/domain/repositories/api_cep_aberto/api_cep_aberto_repository.dart';
import 'package:test_americas_health/model/address_model.dart';

class ApiCepAbertoRepositoryImpl implements ApiCepAbertoRepository {
  @override
  Future<AddressModel> getCEP(String cep) async {
    final result = await Dio().get(
      "https://www.cepaberto.com/api/v3/cep",
      options: Options(
        headers: {"Authorization": "Token token=5a1f498c1c012572439488b9f3bc0ab2"},
      ),
      queryParameters: {"cep": cep},
    );
    final address = AddressModel.fromMap(result.data);
    return address;
  }
}
