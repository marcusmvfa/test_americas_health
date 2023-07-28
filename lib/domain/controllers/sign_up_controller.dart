import 'package:flutter/material.dart';
import 'package:test_americas_health/dependency_injection.dart';
import 'package:test_americas_health/domain/repositories/user/user_repository.dart';
import 'package:test_americas_health/model/user_model.dart';

class SignUpController {
  final _userRepository = getIt<UserRepository>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future createUser() async {
    final newUser = UserModel(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
    );
    return await _userRepository.createUser(
      newUser,
      passwordController.text,
    );
  }
}
