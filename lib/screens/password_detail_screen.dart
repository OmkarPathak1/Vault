import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:password_manager/models/password_model.dart';
import 'package:password_manager/providers/password_provider.dart';

class PasswordDetailScreen extends StatefulWidget {
  final Password password;

  PasswordDetailScreen({required this.password});

  @override
  _PasswordDetailScreenState createState() => _PasswordDetailScreenState();
}

class _PasswordDetailScreenState extends State<PasswordDetailScreen> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late TextEditingController _urlController;
  late TextEditingController _nameController;
  bool _obscureText = true;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController(text: widget.password.username);
    _passwordController = TextEditingController(text: widget.password.password);
    _urlController = TextEditingController(text: widget.password.url);
    _nameController = TextEditingController(text: widget.password.name);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _urlController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void _toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _savePassword() {
    final updatedPassword = Password(
      name: _nameController.text,
      username: _usernameController.text,
      password: _passwordController.text,
      url: _urlController.text,
    );

    Provider.of<PasswordProvider>(context, listen: false)
        .updatePassword(widget.password, updatedPassword);

    _toggleEditing();
  }

  void _deletePassword() {
    Provider.of<PasswordProvider>(context, listen: false)
        .deletePassword(widget.password);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Password Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                border: OutlineInputBorder(),
              ),
              readOnly: !_isEditing,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
              readOnly: !_isEditing,
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
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
              readOnly: !_isEditing,
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _urlController,
              decoration: InputDecoration(
                labelText: 'URL',
                border: OutlineInputBorder(),
              ),
              readOnly: !_isEditing,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _isEditing ? _savePassword : _toggleEditing,
                  icon: Icon(_isEditing ? Icons.save : Icons.edit),
                  label: Text(_isEditing ? 'Save' : 'Edit'),
                ),
                ElevatedButton.icon(
                  onPressed: _deletePassword,
                  icon: Icon(Icons.delete),
                  label: Text('Delete'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
