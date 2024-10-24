// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:password_manager/models/password_model.dart';
// import 'package:password_manager/models/secure_note_model.dart'; // Add this import

// class PasswordProvider with ChangeNotifier {
//   final FlutterSecureStorage _storage = FlutterSecureStorage();
//   List<Password> _passwords = [];
//   List<SecureNote> _notes = []; // Add this line

//   List<Password> get passwords => _passwords;
//   List<SecureNote> get notes => _notes; // Add this line

//   void setMasterPassword(String masterPassword) {
//     // Save the master password securely, if needed.
//   }

//   Future<void> addPassword(Password password) async {
//     _passwords.add(password);
//     await _saveToStorage();
//     notifyListeners();
//   }

//   Future<void> updatePassword(Password oldPassword, Password newPassword) async {
//     final index = _passwords.indexOf(oldPassword);
//     if (index != -1) {
//       _passwords[index] = newPassword;
//       await _saveToStorage();
//       notifyListeners();
//     }
//   }

//   Future<void> deletePassword(Password password) async {
//     _passwords.remove(password);
//     await _saveToStorage();
//     notifyListeners();
//   }

//   Future<void> addSecureNote(SecureNote note) async {
//     _notes.add(note);
//     await _saveNotesToStorage();
//     notifyListeners();
//   }

//   Future<void> _saveToStorage() async {
//     for (var password in _passwords) {
//       await _storage.write(key: password.url, value: password.toJson());
//     }
//   }

//   Future<void> _saveNotesToStorage() async {
//     for (var note in _notes) {
//       await _storage.write(key: note.title, value: note.toJson());
//     }
//   }

//   Future<void> loadPasswords() async {
//     final all = await _storage.readAll();
//     _passwords =
//         all.entries.map((entry) => Password.fromJson(entry.value)).toList();
//     notifyListeners();
//   }

//   Future<void> loadNotes() async {
//     final all = await _storage.readAll();
//     _notes = all.entries.map((entry) => SecureNote.fromJson(entry.value)).toList();
//     notifyListeners();
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:password_manager/models/password_model.dart';
// import 'package:password_manager/models/secure_note_model.dart';

// class PasswordProvider with ChangeNotifier {
//   List<Password> _passwords = [];
//   List<SecureNote> _notes = [];
//   String? _masterPassword;

//   List<Password> get passwords => _passwords;
//   List<SecureNote> get notes => _notes;

//   void addPassword(Password password) {
//     _passwords.add(password);
//     notifyListeners();
//   }

//   void updatePassword(Password oldPassword, Password newPassword) {
//     final index = _passwords.indexOf(oldPassword);
//     if (index != -1) {
//       _passwords[index] = newPassword;
//       notifyListeners();
//     }
//   }

//   void deletePassword(Password password) {
//     _passwords.remove(password);
//     notifyListeners();
//   }

//   void addNote(SecureNote note) {
//     _notes.add(note);
//     notifyListeners();
//   }

//   void updateNote(SecureNote oldNote, SecureNote newNote) {
//     final index = _notes.indexOf(oldNote);
//     if (index != -1) {
//       _notes[index] = newNote;
//       notifyListeners();
//     }
//   }

//   void deleteNote(SecureNote note) {
//     _notes.remove(note);
//     notifyListeners();
//   }

//   void setMasterPassword(String masterPassword) {
//     _masterPassword = masterPassword;
//     notifyListeners();
//   }

//   bool verifyMasterPassword(String masterPassword) {
//     return _masterPassword == masterPassword;
//   }
// }

import 'package:flutter/material.dart';
import 'package:password_manager/models/password_model.dart';
import 'package:password_manager/models/secure_note_model.dart';

class PasswordProvider with ChangeNotifier {
  List<Password> _passwords = [];
  List<SecureNote> _notes = [];
  String? _masterPassword;

  List<Password> get passwords => _passwords;
  List<SecureNote> get notes => _notes;

  // Set Master Password
  void setMasterPassword(String masterPassword) {
    _masterPassword = masterPassword;
    notifyListeners();
  }

  // Verify Master Password
  bool verifyMasterPassword(String masterPassword) {
    return _masterPassword == masterPassword;
  }

  // Add Password
  void addPassword(Password password) {
    _passwords.add(password);
    notifyListeners();
  }

  // Update Password
  void updatePassword(Password oldPassword, Password newPassword) {
    final index = _passwords.indexOf(oldPassword);
    if (index != -1) {
      _passwords[index] = newPassword;
      notifyListeners();
    }
  }

  // Delete Password
  void deletePassword(Password password) {
    _passwords.remove(password);
    notifyListeners();
  }

  // Add Secure Note
  void addSecureNote(SecureNote note) {
    _notes.add(note);
    notifyListeners();
  }

  // Update Secure Note
  void updateSecureNote(SecureNote oldNote, SecureNote newNote) {
    final index = _notes.indexOf(oldNote);
    if (index != -1) {
      _notes[index] = newNote;
      notifyListeners();
    }
  }

  // Delete Secure Note
  void deleteSecureNote(SecureNote note) {
    _notes.remove(note);
    notifyListeners();
  }
}
