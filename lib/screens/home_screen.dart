import 'package:flutter/material.dart';
import 'package:password_manager/screens/password_generation_screen.dart';
import 'package:password_manager/screens/password_storage_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Password Manager'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Generate Password'),
              Tab(text: 'Store Password'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PasswordGenerationScreen(),
            PasswordStorageScreen(),
          ],
        ),
      ),
    );
  }
}
