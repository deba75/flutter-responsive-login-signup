import 'package:flutter/material.dart';
import 'package:responsive_signup/pages/login_new.dart';

void main() {
  // Ensure proper widget binding
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive Login',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff6b63ff)),
        useMaterial3: true,
      ),
      home: const Login(),
    );
  }
}
