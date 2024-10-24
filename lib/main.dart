import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/master_password_screen.dart';
import 'screens/password_storage_screen.dart';
import 'screens/password_generation_screen.dart';
import 'providers/password_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PasswordProvider(),
      child: PasswordManagerApp(),
    ),
  );
}

class PasswordManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.orangeAccent,
        ),
      ),
      home: MasterPasswordScreen(),
      routes: {
        '/password_storage': (context) => PasswordStorageScreen(),
        '/password_generation': (context) => PasswordGenerationScreen(),
      },
    );
  }
}
