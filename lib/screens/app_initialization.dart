// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:password_manager/providers/password_provider.dart';
// import 'package:password_manager/screens/master_password_screen.dart';
// import 'set_master_password_screen.dart';

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => PasswordProvider(),
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Password Manager',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Consumer<PasswordProvider>(
//         builder: (context, provider, child) {
//           return provider.verifyMasterPassword("") // Adjust this to your needs
//               ? PasswordStorageScreen()
//               : SetMasterPasswordScreen();
//         },
//       ),
//     );
//   }
// }
