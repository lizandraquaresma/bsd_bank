import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/statement_table.dart';

class StatementView extends StatelessWidget {
  const StatementView({super.key});
  static const name = 'transaction';
  static void go(BuildContext context) => context.goNamed(name);

  @override
  Widget build(BuildContext context) {
    final texts = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
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
    );
  }
}
