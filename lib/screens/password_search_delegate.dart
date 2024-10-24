import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:password_manager/providers/password_provider.dart';
import 'password_detail_screen.dart';
import 'note_detail_screen.dart';

class PasswordSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final passwordProvider = Provider.of<PasswordProvider>(context, listen: false);
    final passwords = passwordProvider.passwords.where((password) => password.name.toLowerCase().contains(query.toLowerCase())).toList();
    final notes = passwordProvider.notes.where((note) => note.title.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView(
      children: [
        ...passwords.map((password) => ListTile(
              title: Text(password.name),
              subtitle: Text(password.url),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PasswordDetailScreen(password: password),
                  ),
                );
              },
            )),
        ...notes.map((note) => ListTile(
              title: Text(note.title),
              subtitle: Text(note.content),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NoteDetailScreen(note: note),
                  ),
                );
              },
            )),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final passwordProvider = Provider.of<PasswordProvider>(context, listen: false);
    final passwords = passwordProvider.passwords.where((password) => password.name.toLowerCase().contains(query.toLowerCase())).toList();
    final notes = passwordProvider.notes.where((note) => note.title.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView(
      children: [
        ...passwords.map((password) => ListTile(
              title: Text(password.name),
              subtitle: Text(password.url),
              onTap: () {
                query = password.name;
                showResults(context);
              },
            )),
        ...notes.map((note) => ListTile(
              title: Text(note.title),
              subtitle: Text(note.content),
              onTap: () {
                query = note.title;
                showResults(context);
              },
            )),
      ],
    );
  }
}
