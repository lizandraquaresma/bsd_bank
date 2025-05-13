import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tr_extension/tr_extension.dart';

import 'login_page.dart';
import 'register_page.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  static const name = 'initial';
  static void go(BuildContext context) => context.goNamed(name);

  @override
  Widget build(BuildContext context) {
    final texts = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bgd1.PNG'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [
                Colors.black.withOpacity(1),
                Colors.black.withOpacity(1),
                Colors.black.withOpacity(1),
                Colors.black.withOpacity(0.5),
                Colors.black.withOpacity(0.0),
              ],
            ),
          ),
          child: Column(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'initial.page.title'.tr,
                textAlign: TextAlign.center,
                style: texts.titleLarge?.copyWith(
                  color: colors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'initial.page.subtitle'.tr,
                textAlign: TextAlign.center,
                style: texts.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'initial.page.description'.tr,
                textAlign: TextAlign.center,
                style: texts.bodySmall,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primary,
                  foregroundColor: colors.onPrimary,
                ),
                onPressed: () => LoginPage.go(context),
                child: Text('initial.page.button.login'.tr),
              ),
              TextButton(
                onPressed: () => RegisterPage.go(context),
                child: Text('initial.page.button.create'.tr),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
