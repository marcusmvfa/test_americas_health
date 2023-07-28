import 'package:test_americas_health/model/address_model.dart';

abstract class ApiCepAbertoRepository {
  Future<AddressModel> getCEP(String cep);
}
