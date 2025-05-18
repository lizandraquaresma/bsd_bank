import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provide_it/provide_it.dart';

import '../models/transaction_model.dart';
import '../view_models/account_view_model.dart';

class StatementTable extends StatefulWidget {
  const StatementTable({
    super.key,
    this.showAll = false,
  });

  /// Se true, mostra todas as transações. Se false, mostra apenas as 5 primeiras.
  final bool showAll;

  @override
  State<StatementTable> createState() => _StatementTableState();
}

class _StatementTableState extends State<StatementTable> {
  int? _sortColumnIndex;
  bool _sortAscending = true;

  void _onSort(int columnIndex, bool ascending) {
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  List<TransactionModel> _getSortedTransactions() {
    final statement = context.read<AccountViewModel>().statement;
    final transactions = widget.showAll
        ? statement.transactions
        : statement.transactions.take(5).toList();

    if (_sortColumnIndex == null) return transactions;

    return List.from(transactions)
      ..sort((a, b) {
        final aValue = _getColumnValue(a, _sortColumnIndex!);
        final bValue = _getColumnValue(b, _sortColumnIndex!);

        var comparison = 0;
        if (aValue is num && bValue is num) {
          comparison = aValue.compareTo(bValue);
        } else if (aValue is DateTime && bValue is DateTime) {
          comparison = aValue.compareTo(bValue);
        } else {
          comparison = aValue.toString().compareTo(bValue.toString());
        }

        return _sortAscending ? comparison : -comparison;
      });
  }

  dynamic _getColumnValue(TransactionModel transaction, int columnIndex) {
    switch (columnIndex) {
      case 0:
        return transaction.value;
      case 1:
        return transaction.description ?? transaction.type;
      case 2:
        return transaction.createdAt;
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final texts = Theme.of(context).textTheme;

    final transactions = _getSortedTransactions();

    return SizedBox(
      width: double.infinity,
      child: DataTable(
        dividerThickness: 0,
        headingRowColor: WidgetStateProperty.all(Colors.transparent),
        dataRowColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return colors.primaryContainer;
            }

            return null;
          },
        ),
        sortColumnIndex: _sortColumnIndex,
        sortAscending: _sortAscending,
        columns: [
          DataColumn(
            label: Text(
              'Valor',
              style: texts.bodySmall?.copyWith(
                color: colors.onSurface.withValues(alpha: 0.7),
              ),
            ),
            onSort: _onSort,
          ),
          DataColumn(
            label: Text(
              'Nome',
              style: texts.bodySmall?.copyWith(
                color: colors.onSurface.withValues(alpha: 0.7),
              ),
            ),
            onSort: _onSort,
          ),
          DataColumn(
            label: Text(
              'Data',
              style: texts.bodySmall?.copyWith(
                color: colors.onSurface.withValues(alpha: 0.7),
              ),
            ),
            onSort: _onSort,
          ),
        ],
        rows: transactions.asMap().entries.map((entry) {
          final index = entry.key;
          final transaction = entry.value;
          final isPositive = transaction.type == 'CREDIT';
          final value = transaction.value;
          final name = transaction.description ?? transaction.type;
          final date = transaction.createdAt;

          return DataRow(
            color: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  return colors.primaryContainer;
                }

                return index.isOdd ? colors.surfaceContainer : null;
              },
            ),
            cells: [
              DataCell(
                Text(
                  'R\$${value.toStringAsFixed(2).replaceAll('.', ',')}',
                  style: texts.bodySmall?.copyWith(
                    color: isPositive ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataCell(
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: texts.bodyMedium,
                ),
              ),
              DataCell(
                Text(
                  DateFormat('dd MMM', 'pt_BR').format(date).toUpperCase(),
                  style: texts.bodyMedium,
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
