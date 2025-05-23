import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provide_it/provide_it.dart';

import '../models/balance_model.dart';
import '../view_models/account_view_model.dart';

class BalanceWidget extends StatefulWidget {
  const BalanceWidget({super.key, required this.balance});

  final BalanceModel? balance;

  @override
  State<BalanceWidget> createState() => _BalanceWidgetState();
}

class _BalanceWidgetState extends State<BalanceWidget> {
  var isObscured = true;

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
          child: balanceHistory.isEmpty
              ? Center(
                  child: Text(
                    'Nenhum dado disponível',
                    style: TextStyle(
                      color: colors.onSurface.withAlpha(70),
                    ),
                  ),
                )
              : LineChart(
                  LineChartData(
                    gridData: FlGridData(
                      horizontalInterval: 200,
                      getDrawingHorizontalLine: (_) {
                        return FlLine(
                          color: colors.outline.withAlpha(20),
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
                            final date =
                                balanceHistory[value.toInt()].lastUpdate;

                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                _getMonthAbbreviation(date.month),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: colors.onSurface.withAlpha(70),
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
                        bottom: BorderSide(
                          color: colors.outline.withAlpha(20),
                        ),
                        left: BorderSide(
                          color: colors.outline.withAlpha(20),
                        ),
                      ),
                    ),
                    minX: 0,
                    maxX: balanceHistory.length - 1.0,
                    minY: 0,
                    maxY: balanceHistory.isEmpty
                        ? 100
                        : balanceHistory
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
                              colors.primary.withAlpha(20),
                              colors.primary.withAlpha(0),
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
