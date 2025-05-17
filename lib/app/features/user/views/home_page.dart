import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provide_it/provide_it.dart';

import '../../account/view_models/account_view_model.dart';
import '../../account/widgets/balance_widget.dart';
import '../../account/widgets/transaction_container.dart';
import '../../account/widgets/transactions_table.dart';
import '../../account/views/transaction_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const name = 'home';
  static void go(BuildContext context) => context.goNamed(name);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final balance = context.watch<AccountViewModel>().balance;
    final optionn = [
      TransactionContainer(
        onTap: () {
          print('enviar pix');
        },
        title: 'Enviar pix',
        icon: Icons.pix_rounded,
      ),
      TransactionContainer(
        onTap: () {
          print('receber pix');
        },
        title: 'Receber pix',
        icon: Icons.pix,
      ),
      TransactionContainer(
        onTap: () {
          print('transferir');
        },
        title: 'Transferir',
        icon: Icons.transfer_within_a_station,
      ),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colors.surfaceContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Saldo:'),
                  AccountBalanceWidget(balance: balance),
                ],
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                itemCount: optionn.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: optionn[index],
                ),
              ),
            ),
            TransactionsTable(
              onViewAllPressed: TransactionView.go,
            ),
          ],
        ),
      ),
    );
  }
}
