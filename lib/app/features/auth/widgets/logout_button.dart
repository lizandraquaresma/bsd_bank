import 'package:flutter/material.dart';
import 'package:provide_it/provide_it.dart';

import '../view_models/auth_store.dart';
import '../views/initial_page.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final texts = Theme.of(context).textTheme;

    return InkWell(
      onTap: () {
        context.read<AuthStore>().logout();
        InitialPage.go(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: colors.surfaceContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          spacing: 16,
          children: [
            const Icon(Icons.logout),
            Text(
              'Sair da sua conta',
              style: texts.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
