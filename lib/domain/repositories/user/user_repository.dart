import 'package:test_americas_health/model/user_model.dart';

abstract class UserRepository {
  Future addUser(UserModel user);
  Future<UserModel> loginUser(String email, String password);
  Future<UserModel> fetcUserInfo(String userId);
}
