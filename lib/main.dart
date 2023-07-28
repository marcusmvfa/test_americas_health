import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:test_americas_health/dependency_injection.dart';
import 'package:test_americas_health/domain/controllers/user_controller.dart';
import 'package:test_americas_health/firebase_options.dart';
import 'package:test_americas_health/dependency_injection.dart' as di;
import 'package:test_americas_health/presentation/home/home_view.dart';
import 'package:test_americas_health/presentation/login/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  di.setup();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final _userController = getIt<UserController>();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
          future: _userController.isUserLogged(),
          builder: (context, snapshot) {
            if (snapshot.data != null && snapshot.data == false) {
              return LoginView();
            }
            return HomeView();
          }),
    );
  }
}
