import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/transactions_table.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({super.key});
  static const name = 'transaction';
  static void go(BuildContext context) => context.goNamed(name);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: TransactionsTable(showAll: true),
      ),
    );
  }
}
