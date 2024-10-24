import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:password_manager/screens/master_password_screen.dart';
import 'package:password_manager/screens/password_detail_screen.dart';
import 'package:password_manager/screens/password_generation_screen.dart';
import 'package:password_manager/screens/password_storage_screen.dart';
import 'package:password_manager/providers/password_provider.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Password Manager App Test', (WidgetTester tester) async {
    // Build the app with the necessary providers.
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => PasswordProvider(),
        // child: const MyApp(),
      ),
    );

    // Verify the initial screen is the Master Password Screen.
    expect(find.byType(MasterPasswordScreen), findsOneWidget);

    // Enter a master password and navigate to the password storage screen.
    await tester.enterText(find.byType(TextFormField), 'master_password');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    // Verify we are on the Password Storage Screen.
    expect(find.byType(PasswordStorageScreen), findsOneWidget);

    // Navigate to the Password Generation Screen.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(find.byType(PasswordGenerationScreen), findsOneWidget);

    // Fill in the password generation form.
    await tester.enterText(find.byKey(Key('nameField')), 'Test Name');
    await tester.enterText(find.byKey(Key('usernameField')), 'Test Username');
    await tester.tap(find.byKey(Key('generatePasswordButton')));
    await tester.pumpAndSettle();

    // Check if a password was generated.
    expect(find.textContaining('Generated Password'), findsOneWidget);

    // Save the generated password.
    await tester.enterText(find.byKey(Key('urlField')), 'https://example.com');
    await tester.tap(find.byKey(Key('savePasswordButton')));
    await tester.pumpAndSettle();

    // Verify we are back on the Password Storage Screen with the new password listed.
    expect(find.byType(PasswordStorageScreen), findsOneWidget);
    expect(find.text('Test Name'), findsOneWidget);
    expect(find.text('https://example.com'), findsOneWidget);

    // Tap on the saved password to view details.
    await tester.tap(find.text('Test Name'));
    await tester.pumpAndSettle();

    // Verify we are on the Password Detail Screen.
    expect(find.byType(PasswordDetailScreen), findsOneWidget);
    expect(find.text('Test Name'), findsOneWidget);
    expect(find.text('Test Username'), findsOneWidget);
    expect(find.text('https://example.com'), findsOneWidget);
  });
}

