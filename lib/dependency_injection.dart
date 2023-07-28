import 'package:get_it/get_it.dart';
import 'package:test_americas_health/data/repository/contact/contact_repository_impl.dart';
import 'package:test_americas_health/data/repository/user/user_repository_impl.dart';
import 'package:test_americas_health/domain/controllers/login_controller.dart';
import 'package:test_americas_health/domain/repositories/contact/contact_repository.dart';
import 'package:test_americas_health/domain/repositories/user/user_repository.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
  getIt.registerSingleton<LoginController>(LoginController());
  getIt.registerSingleton<ContactRepository>(ContactRepositoryImpl());
}
