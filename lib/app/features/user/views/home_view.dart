import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provide_it/provide_it.dart';

import '../../../shared/widgets/profile_app_bar.dart';
import '../../account/view_models/account_view_model.dart';
import '../../account/views/statement_view.dart';
import '../../account/widgets/balance_widget.dart';
import '../../account/widgets/statement_container.dart';
import '../../account/widgets/statement_table.dart';
import '../../pix/views/send_pix_dialog.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const name = 'home';
  static void go(BuildContext context) => context.goNamed(name);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final texts = Theme.of(context).textTheme;
    final balance = context.watch<AccountViewModel>().balance;
    final pixOptions = [
      TransactionOptionButton(
        onTap: () {
          SendPixDialog.show(context);
        },
        title: 'Enviar pix',
        icon: Icons.pix_rounded,
      ),
      TransactionOptionButton(
        onTap: () {
          if (kDebugMode) {
            print('receber pix');
          }
        },
        title: 'Receber pix',
        icon: Icons.pix,
      ),
      TransactionOptionButton(
        onTap: () {
          if (kDebugMode) {
            print('Minhas chaves');
          }
        },
        title: 'Minhas chaves',
        icon: Icons.key,
      ),
      TransactionOptionButton(
        onTap: () {
          if (kDebugMode) {
            print('transferir');
          }
        },
        title: 'Transferir',
        icon: Icons.transfer_within_a_station,
      ),
    ];

    return Scaffold(
      appBar: const ProfileAppBar(),
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
                  Text(
                    'Saldo:',
                    style: texts.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  BalanceWidget(balance: balance),
                ],
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                itemCount: pixOptions.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: pixOptions[index],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Ultimas transações',
                    style: texts.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () => StatementView.go(context),
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: Row(
                    children: [
                      Text(
                        'Ver todos',
                        style:
                            texts.bodySmall?.copyWith(color: colors.onSurface),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.arrow_forward, size: 16),
                    ],
                  ),
                ),
              ],
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: colors.surfaceContainer,
              ),
              child: const StatementTable(),
            ),
          ],
        ),
      ),
    );
  }
}
