import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class LoginScreen extends StatelessWidget {
  final LocalAuthentication auth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            bool authenticated = await auth.authenticate(
              localizedReason: 'Please authenticate to access your passwords',
              options: const AuthenticationOptions(
                biometricOnly: false,
              ),
            );
            if (authenticated) {
              Navigator.pushReplacementNamed(context, '/home');
            }
          },
          child: Text('Authenticate'),
        ),
      ),
    );
  }
}
