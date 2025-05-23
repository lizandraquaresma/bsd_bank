import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static const name = 'register';
  static void go(BuildContext context) => context.goNamed(name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: RegisterForm(),
      ),
    );
  }
}
