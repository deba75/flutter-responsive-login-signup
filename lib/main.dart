import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_signup/pages/login_new.dart';
import 'package:responsive_signup/theme/theme_provider.dart';

void main() {
  // Ensure proper widget binding
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Responsive Login',
          theme: themeProvider.currentTheme,
          home: const Login(),
        );
      },
    );
  }
}
