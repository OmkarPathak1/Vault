// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'password_generation_screen.dart';
// import 'password_detail_screen.dart';
// import 'secure_notes_screen.dart';
// import 'package:password_manager/providers/password_provider.dart';
// import 'note_detail_screen.dart';  // Ensure this import exists
// import 'package:password_manager/models/secure_note_model.dart';  // Ensure this import exists

// class PasswordStorageScreen extends StatefulWidget {
//   @override
//   _PasswordStorageScreenState createState() => _PasswordStorageScreenState();
// }

// class _PasswordStorageScreenState extends State<PasswordStorageScreen> with SingleTickerProviderStateMixin {
//   TabController? _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final passwords = Provider.of<PasswordProvider>(context).passwords;

//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Password Manager'),
//           bottom: TabBar(
//             controller: _tabController,
//             indicatorColor: Theme.of(context).colorScheme.secondary,
//             labelColor: Theme.of(context).colorScheme.primary,
//             unselectedLabelColor: Theme.of(context).colorScheme.onSurface,
//             tabs: [
//               Tab(text: 'Stored Passwords'),
//               Tab(text: 'Secure Notes'),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           controller: _tabController,
//           children: [
//             ListView.builder(
//               itemCount: passwords.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   elevation: 5,
//                   child: ListTile(
//                     title: Align(
//                       alignment: Alignment.centerRight,
//                       child: Text(
//                         passwords[index].name,
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                         ),
//                       ),
//                     ),
//                     subtitle: Align(
//                       alignment: Alignment.centerRight,
//                       child: Text(passwords[index].url),
//                     ),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               PasswordDetailScreen(password: passwords[index]),
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               },
//             ),
//             SecureNotesScreen(),
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           heroTag: _tabController?.index == 0 ? "btn1" : "btn2",
//           onPressed: () {
//             if (_tabController?.index == 0) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => PasswordGenerationScreen()),
//               );
//             } else {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => NoteDetailScreen(
//                     note: SecureNote(
//                       title: '',
//                       content: '',
//                     ),
//                   ),
//                 ),
//               );
//             }
//           },
//           child: Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'password_generation_screen.dart';
import 'password_detail_screen.dart';
import 'secure_notes_screen.dart';
import 'note_detail_screen.dart';
import 'password_search_delegate.dart'; // Ensure this import exists
import 'package:password_manager/providers/password_provider.dart';
import 'package:password_manager/models/secure_note_model.dart';

class PasswordStorageScreen extends StatefulWidget {
  @override
  _PasswordStorageScreenState createState() => _PasswordStorageScreenState();
}

class _PasswordStorageScreenState extends State<PasswordStorageScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  void _startSearch(BuildContext context) {
    showSearch(context: context, delegate: PasswordSearchDelegate());
  }

  @override
  Widget build(BuildContext context) {
    final passwords = Provider.of<PasswordProvider>(context).passwords;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text('Password Manager'),
              Spacer(),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () => _startSearch(context),
              ),
            ],
          ),
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Theme.of(context).colorScheme.secondary,
            labelColor: Theme.of(context).colorScheme.primary,
            unselectedLabelColor: Theme.of(context).colorScheme.onSurface,
            tabs: [
              Tab(text: 'Stored Passwords'),
              Tab(text: 'Secure Notes'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView.builder(
              itemCount: passwords.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                  child: ListTile(
                    title: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        passwords[index].name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    subtitle: Align(
                      alignment: Alignment.centerRight,
                      child: Text(passwords[index].url),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PasswordDetailScreen(password: passwords[index]),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            SecureNotesScreen(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: _tabController?.index == 0 ? "btn1" : "btn2",
          onPressed: () {
            if (_tabController?.index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PasswordGenerationScreen()),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NoteDetailScreen(
                    note: SecureNote(
                      title: '',
                      content: '',
                    ),
                  ),
                ),
              );
            }
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
