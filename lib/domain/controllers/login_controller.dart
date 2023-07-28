import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_americas_health/domain/repositories/user/user_repository.dart';
import 'package:test_americas_health/dependency_injection.dart';

class LoginController {
  final UserRepository _userRepository = getIt<UserRepository>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool isLoading = false.obs;
  final String apiKey = "5a1f498c1c012572439488b9f3bc0ab2";

  Future loginUser() async {
    await _userRepository.loginUser(
      emailController.text,
      passwordController.text,
    );
  }
}
