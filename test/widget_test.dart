import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:order_app/core/models/user_model.dart';
import 'package:order_app/core/services/auth_services.dart';
import 'package:order_app/modules/user/auth/sign_in_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyWidgetTest(),
    );
  }
}

class MyWidgetTest extends StatelessWidget {
  const MyWidgetTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Testing AuthScreen Title'),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AuthScreen()),
              ),
              child: const Text('Go to AuthScreen'),
            ),
          ],
        ),
      ),
    );
  }
}

// Uncomment and implement these tests once AuthService logic is complete
// import 'package:your_app_name/auth_service.dart'; // Replace with your app's name

class AuthServiceMock extends AuthService {
  @override
  Future<AppUser?> signInWithGoogle() async {
    // Implement mock behavior for testing
    return AppUser(uid: 'test_uid', email: 'test@email.com');
  }
}

void testSignInWithGoogle(AuthService authService) async {
  final mockAuthService = AuthServiceMock();
  final user = await mockAuthService.signInWithGoogle();
  expect(user?.uid, 'test_uid');
  expect(user?.email, 'test@email.com');
}
