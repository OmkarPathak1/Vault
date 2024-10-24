// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:password_manager/models/secure_note_model.dart';
// import 'package:password_manager/providers/password_provider.dart';
// import 'note_detail_screen.dart';

// class SecureNotesScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final notes = Provider.of<PasswordProvider>(context).notes;

//     return Scaffold(
//       body: ListView.builder(
//         itemCount: notes.length,
//         itemBuilder: (context, index) {
//           return Card(
//             margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             elevation: 5,
//             child: ListTile(
//               title: Text(
//                 notes[index].title,
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               subtitle: Text(notes[index].content),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => NoteDetailScreen(note: notes[index]),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => NoteDetailScreen(
//                 note: SecureNote(
//                   title: '',
//                   content: '',
//                 ),
//               ),
//             ),
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:password_manager/providers/password_provider.dart';
import 'note_detail_screen.dart';

class SecureNotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notes = Provider.of<PasswordProvider>(context).notes;

    return Scaffold(
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5,
            child: ListTile(
              title: Text(
                notes[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(notes[index].content),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NoteDetailScreen(note: notes[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
