import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const name = 'login';
  static void go(BuildContext context) => context.goNamed(name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: LoginForm(),
      ),
    );
  }
}
