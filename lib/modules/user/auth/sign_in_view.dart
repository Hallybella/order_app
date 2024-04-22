import 'package:flutter/material.dart';
import 'package:order_app/core/state/loader_view.dart';
import 'package:order_app/modules/user/auth/sign_in_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => AuthViewModel(),
        builder: (context, model, child) => LoaderView(
              loading: model.isBusy,
              child: Scaffold(
                appBar: AppBar(
                  title: const Text("Order Tracking App"),
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Sign in to track your orders",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: model.signInWithGoogle,
                        child: const Text("Sign in with Google"),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: model.signInWithGitHub,
                        child:
                            const Text("Sign in with GitHub (Not Implemented)"),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
