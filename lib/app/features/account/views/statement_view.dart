import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/widgets/profile_app_bar.dart';
import '../widgets/statement_table.dart';

class StatementView extends StatelessWidget {
  const StatementView({super.key});
  static const name = 'transaction';
  static void go(BuildContext context) => context.goNamed(name);

  @override
  Widget build(BuildContext context) {
    final texts = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const ProfileAppBar(),
      body: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colors.surfaceContainer,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Todas as transações',
              style: texts.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const StatementTable(showAll: true),
          ],
        ),
      ),
    );
  }
}
