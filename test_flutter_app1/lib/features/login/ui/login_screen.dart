import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final bool isFromOnboarding = args?['isFromOnboarding'] ?? false;
    final int id = args?['id'] ?? 0;
    final String name = args?['name'] ?? '';
    return Scaffold(
      body: Center(
        child: Text(
          'Login Screen Onboarding: $isFromOnboarding\nID: $id\nName: $name',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
