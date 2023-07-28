import 'package:get_it/get_it.dart';
import 'package:test_americas_health/data/repository/contact/contact_repository_impl.dart';
import 'package:test_americas_health/data/repository/user/user_repository_impl.dart';
import 'package:test_americas_health/domain/controllers/user_controller.dart';
import 'package:test_americas_health/domain/controllers/sign_up_controller.dart';
import 'package:test_americas_health/domain/repositories/contact/contact_repository.dart';
import 'package:test_americas_health/domain/repositories/user/user_repository.dart';

import 'domain/controllers/contact_controller.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
  getIt.registerSingleton<UserController>(UserController());
  getIt.registerSingleton<ContactRepository>(ContactRepositoryImpl());
  getIt.registerFactory<SignUpController>(() => SignUpController());
  getIt.registerSingleton<ContactController>(ContactController());
}
