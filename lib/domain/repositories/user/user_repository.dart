import 'package:test_americas_health/model/user_model.dart';

abstract class UserRepository {
  Future createUser(UserModel user, String password);
  Future<UserModel?> loginUser(String email, String password);
  Future<UserModel> fetcUserInfo(String userId);
  Future<UserModel?> fetchCurrentUser();
  Future logoutUser();
}
