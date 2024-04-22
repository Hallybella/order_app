import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:order_app/app/app.logger.dart';
import 'package:order_app/app/app.router.dart';
import 'package:order_app/core/models/user_model.dart';
import 'package:order_app/core/shared/shared.dart';
import 'package:stacked/stacked.dart';

class AuthViewModel extends BaseViewModel {
  final log = getLogger("AuthViewModel");
  // final AuthService _authService = AuthService();
  Future<UserCredential> getSignInWithGoogle() async {
    const List<String> scopes = <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ];
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: scopes).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    log.v(credential);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void signInWithGoogle() async {
    final user = await getSignInWithGoogle();
    // log.v(user.toString());
    navigationService.replaceWithDashboardScreen(
      user: AppUser(uid: user.user!.uid, email: user.user?.displayName ?? ""),
    );
  }

  void signInWithGitHub() async {
    // Implement similar logic for signing in with GitHub
    // log("Sign in with GitHub not implemented yet");
  }
}
