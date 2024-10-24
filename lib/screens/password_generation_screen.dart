import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:password_manager/models/password_model.dart';
import 'package:password_manager/providers/password_provider.dart';
import 'dart:math';

class PasswordGenerationScreen extends StatefulWidget {
  @override
  _PasswordGenerationScreenState createState() => _PasswordGenerationScreenState();
}

class _PasswordGenerationScreenState extends State<PasswordGenerationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  bool _obscureText = true;
  bool _includeSymbols = true;
  bool _includeNumbers = true;
  bool _includeUppercase = true;
  bool _includeLowercase = true;
  int _passwordLength = 16;

  final _formKey = GlobalKey<FormState>();

  String _generatePassword() {
    const symbols = '!@#\$%^&*()_+-=[]{}|;:\'",.<>?/';
    const numbers = '0123456789';
    const uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const lowercase = 'abcdefghijklmnopqrstuvwxyz';

    String chars = '';
    if (_includeSymbols) chars += symbols;
    if (_includeNumbers) chars += numbers;
    if (_includeUppercase) chars += uppercase;
    if (_includeLowercase) chars += lowercase;

    return List.generate(_passwordLength, (index) {
      final randomIndex = Random.secure().nextInt(chars.length);
      return chars[randomIndex];
    }).join('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Generate and Save Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
                obscureText: _obscureText,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Checkbox(
                    value: _includeSymbols,
                    onChanged: (value) {
                      setState(() {
                        _includeSymbols = value!;
                      });
                    },
                  ),
                  Text('Include Symbols'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: _includeNumbers,
                    onChanged: (value) {
                      setState(() {
                        _includeNumbers = value!;
                      });
                    },
                  ),
                  Text('Include Numbers'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: _includeUppercase,
                    onChanged: (value) {
                      setState(() {
                        _includeUppercase = value!;
                      });
                    },
                  ),
                  Text('Include Uppercase'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: _includeLowercase,
                    onChanged: (value) {
                      setState(() {
                        _includeLowercase = value!;
                      });
                    },
                  ),
                  Text('Include Lowercase'),
                ],
              ),
              Row(
                children: [
                  Text('Password Length'),
                  Expanded(
                    child: Slider(
                      value: _passwordLength.toDouble(),
                      min: 8,
                      max: 32,
                      divisions: 24,
                      label: _passwordLength.toString(),
                      onChanged: (value) {
                        setState(() {
                          _passwordLength = value.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  final generatedPassword = _generatePassword();
                  setState(() {
                    _passwordController.text = generatedPassword;
                  });
                },
                child: Text('Generate Password'),
              ),
              TextFormField(
                controller: _urlController,
                decoration: InputDecoration(labelText: 'URL'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a URL';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newPassword = Password(
                      name: _nameController.text,
                      username: _usernameController.text,
                      password: _passwordController.text,
                      url: _urlController.text,
                    );
                    Provider.of<PasswordProvider>(context, listen: false).addPassword(newPassword);
                    Navigator.pop(context);
                  }
                },
                child: Text('Save Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
