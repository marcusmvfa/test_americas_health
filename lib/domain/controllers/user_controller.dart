import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_americas_health/domain/repositories/user/user_repository.dart';
import 'package:test_americas_health/dependency_injection.dart';

class UserController {
  final UserRepository _userRepository = getIt<UserRepository>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool isLoading = false.obs;
  final String apiKey = "5a1f498c1c012572439488b9f3bc0ab2";

  Future loginUser() async {
    try {
      final result = await _userRepository.loginUser(
        emailController.text,
        passwordController.text,
      );
      return result != null;
    } on Exception catch (e) {
      return false;
    }
  }

  Future<bool> isUserLogged() async {
    try {
      final result = await _userRepository.fetchCurrentUser();
      if (result != null) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      return false;
    }
  }

  Future logoutUser() async {
    await _userRepository.logoutUser();
  }
}
