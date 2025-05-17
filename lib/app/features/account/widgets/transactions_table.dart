import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../mocks/transaction_mock.dart';

class TransactionsTable extends StatelessWidget {
  const TransactionsTable({
    super.key,
    this.showAll = false,
    this.onViewAllPressed,
  });

  /// Se true, mostra todas as transações. Se false, mostra apenas as 5 primeiras.
  final bool showAll;

  /// Callback chamado quando o botão "Ver todos" é pressionado.
  final void Function(BuildContext context)? onViewAllPressed;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final texts = Theme.of(context).textTheme;

    // Se showAll for true, mostra todas as transações, senão mostra apenas as 5 primeiras
    final transactions = showAll ? mockData : mockData.take(5).toList();

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  showAll ? 'Todas as transações' : 'Ultimas transações',
                  style:
                      texts.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              if (!showAll && onViewAllPressed != null)
                TextButton(
                  onPressed: () => onViewAllPressed!(context),
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: Row(
                    children: [
                      Text('Ver todos',
                          style: texts.bodySmall
                              ?.copyWith(color: colors.onSurface),),
                      const SizedBox(width: 4),
                      const Icon(Icons.arrow_forward, size: 16),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text('Valor',
                    style: texts.bodySmall
                        ?.copyWith(color: colors.onSurface.withOpacity(0.7)),),
              ),
              Expanded(
                flex: 4,
                child: Text('Nome',
                    style: texts.bodySmall
                        ?.copyWith(color: colors.onSurface.withOpacity(0.7)),),
              ),
              Expanded(
                flex: 2,
                child: Text('Data',
                    style: texts.bodySmall
                        ?.copyWith(color: colors.onSurface.withOpacity(0.7)),),
              ),
            ],
          ),
          const Divider(height: 16),
          ...List.generate(transactions.length, (i) {
            final item = transactions[i];
            final isPositive = item['positive']! as bool;
            final value = item['value']! as double;
            final name = item['name']! as String;
            final date = item['date']! as DateTime;

            return Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: i.isOdd ? colors.surfaceContainer : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: Row(
                spacing: 8,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'R\$${value.toStringAsFixed(2).replaceAll('.', ',')}',
                      style: texts.bodySmall?.copyWith(
                        color: isPositive ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      style: texts.bodyMedium,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      DateFormat('dd MMM', 'pt_BR').format(date).toUpperCase(),
                      style: texts.bodyMedium,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
