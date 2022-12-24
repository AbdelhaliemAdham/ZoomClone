import 'package:flutter/material.dart';

import 'package:zoom_clone/controllers/auth_controller.dart';
import 'package:zoom_clone/widgets/custom_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController authController = AuthController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Start or join a meeting',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 48.0),
            child: Image.asset('assets/images/onboarding.jpg'),
          ),
          CustomButton(
              text: 'Login',
              function: () async {
                bool res = await authController.signInWithGoogle(context);
                if (res) {
                  Navigator.pushNamed(context, '/Home-screen');
                }
              })
        ],
      ),
    );
  }
}
