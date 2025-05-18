import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provide_it/provide_it.dart';

import '../mocks/balance_mock.dart';
import '../models/balance_model.dart';
import '../view_models/account_view_model.dart';

class AccountBalanceWidget extends StatefulWidget {
  const AccountBalanceWidget({
    super.key,
    required this.balance,
  });

  final BalanceModel? balance;

  @override
  State<AccountBalanceWidget> createState() => _AccountBalanceWidgetState();
}

class _AccountBalanceWidgetState extends State<AccountBalanceWidget> {
  bool isObscured = true;

  void toggleObscured() {
    setState(() {
      isObscured = !isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final balanceHistory = context.watch<AccountViewModel>().balanceHistory;

    return Column(
      children: [
        Row(
          spacing: 8,
          children: [
            Container(
              height: 32,
              width: 2,
              decoration: BoxDecoration(
                color: colors.primary,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Flexible(
              child: TextFormField(
                decoration: const InputDecoration(
                  prefixText: r'R$',
                  constraints: BoxConstraints(
                    minHeight: 50,
                  ),
                  border: InputBorder.none,
                ),
                obscureText: isObscured,
                readOnly: true,
                initialValue: widget.balance?.balance.toString() ?? '',
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: toggleObscured,
              icon: Icon(
                isObscured ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(
                horizontalInterval: 200,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: colors.outline.withOpacity(0.2),
                    strokeWidth: 1,
                  );
                },
              ),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    interval: 1,
                    getTitlesWidget: (value, _) {
                      if (value.toInt() >= balanceHistory.length)
                        // ignore: curly_braces_in_flow_control_structures
                        return const Text('');
                      final date = balanceHistory[value.toInt()].lastUpdate;

                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          _getMonthAbbreviation(date.month),
                          style: TextStyle(
                            fontSize: 12,
                            color: colors.onSurface.withOpacity(0.7),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                leftTitles: const AxisTitles(),
                topTitles: const AxisTitles(),
                rightTitles: const AxisTitles(),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border(
                  bottom: BorderSide(color: colors.outline.withOpacity(0.2)),
                  left: BorderSide(color: colors.outline.withOpacity(0.2)),
                ),
              ),
              minX: 0,
              maxX: balanceHistory.length - 1.0,
              minY: 0,
              maxY: balanceHistory
                      .map((e) => e.balance)
                      .reduce((a, b) => a > b ? a : b) +
                  100,
              lineBarsData: [
                LineChartBarData(
                  spots: balanceHistory.asMap().entries.map((entry) {
                    return FlSpot(
                      entry.key.toDouble(),
                      entry.value.balance,
                    );
                  }).toList(),
                  isCurved: true,
                  color: colors.primary,
                  barWidth: 3,
                  isStrokeCapRound: true,
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        colors.primary.withOpacity(0.2),
                        colors.primary.withOpacity(0.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _getMonthAbbreviation(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Fev';
      case 3:
        return 'Mar';
      case 4:
        return 'Abr';
      case 5:
        return 'Mai';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Ago';
      case 9:
        return 'Set';
      case 10:
        return 'Out';
      case 11:
        return 'Nov';
      case 12:
        return 'Dez';
      default:
        return '';
    }
  }
}
