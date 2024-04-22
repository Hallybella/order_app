import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:order_app/core/models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<AppUser?> signInWithGoogle() async {
    try {
      final GoogleAuthProvider googleProvider = GoogleAuthProvider();
      final UserCredential userCredential =
          await _auth.signInWithPopup(googleProvider);
      final user = userCredential.user;
      if (user != null) {
        return AppUser(uid: user.uid, email: user.email!);
      } else {
        return null;
      }
    } catch (e) {
      // Handle authentication errors
      log(e.toString());
      return null;
    }
  }

  Future<User?> signInWithGitHub() async {
    // Implement similar logic for GitHub sign in with GitHubAuthProvider
    return null; // Replace with your GitHub sign in implementation
  }

  Stream<AppUser?> get userStream => _auth.authStateChanges().map((user) =>
      user != null ? AppUser(uid: user.uid, email: user.email!) : null);
}
