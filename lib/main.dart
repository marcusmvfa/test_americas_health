import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_americas_health/firebase_options.dart';
import 'package:test_americas_health/dependency_injection.dart' as di;
import 'package:test_americas_health/presentation/login/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  di.setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}
