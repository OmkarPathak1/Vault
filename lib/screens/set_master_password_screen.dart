// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:password_manager/providers/password_provider.dart';
// import 'password_storage_screen.dart';

// class SetMasterPasswordScreen extends StatelessWidget {
//   final TextEditingController _masterPasswordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Set Master Password')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _masterPasswordController,
//               decoration: InputDecoration(labelText: 'Master Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 if (_masterPasswordController.text.isNotEmpty) {
//                   Provider.of<PasswordProvider>(context, listen: false)
//                       .setMasterPassword(_masterPasswordController.text);
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (context) => PasswordStorageScreen()),
//                   );
//                 }
//               },
//               child: Text('Set Password'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:password_manager/providers/password_provider.dart';
import 'password_storage_screen.dart';

class SetMasterPasswordScreen extends StatelessWidget {
  final TextEditingController _masterPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Set Master Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _masterPasswordController,
              decoration: InputDecoration(labelText: 'Master Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_masterPasswordController.text.isNotEmpty) {
                  Provider.of<PasswordProvider>(context, listen: false)
                      .setMasterPassword(_masterPasswordController.text);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => PasswordStorageScreen()),
                  );
                }
              },
              child: Text('Set Password'),
            ),
          ],
        ),
      ),
    );
  }
}
