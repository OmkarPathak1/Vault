import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:password_manager/models/secure_note_model.dart';
import 'package:password_manager/providers/password_provider.dart';

class NoteDetailScreen extends StatefulWidget {
  final SecureNote note;

  NoteDetailScreen({required this.note});

  @override
  _NoteDetailScreenState createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note.title);
    _contentController = TextEditingController(text: widget.note.content);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note Detail'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final updatedNote = SecureNote(
                title: _titleController.text,
                content: _contentController.text,
              );
              if (widget.note.title.isEmpty && widget.note.content.isEmpty) {
                Provider.of<PasswordProvider>(context, listen: false)
                    .addSecureNote(updatedNote);
              } else {
                Provider.of<PasswordProvider>(context, listen: false)
                    .updateSecureNote(widget.note, updatedNote);
              }
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              Provider.of<PasswordProvider>(context, listen: false)
                  .deleteSecureNote(widget.note);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Content'),
              maxLines: 10,
            ),
          ],
        ),
      ),
    );
  }
}
