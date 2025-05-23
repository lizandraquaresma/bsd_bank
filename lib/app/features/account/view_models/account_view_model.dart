import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../models/balance_model.dart';
import '../models/statement_model.dart';
import '../repositories/account_repository.dart';

class AccountViewModel extends ChangeNotifier {
  AccountViewModel(
    this._accountRepository, {
    required this.bank,
    required this.agency,
    required this.account,
  }) {
    fetchBalance();
    fetchStatement();
    fetchBalanceHistory();
  }

  final AccountRepository _accountRepository;
  final int bank;
  final int agency;
  final String account;

  BalanceModel? _balance;
  StatementModel? _statement;
  List<BalanceModel> _balanceHistory = [];

  StatementModel get statement => _statement ?? const StatementModel();
  BalanceModel get balance =>
      _balance ?? BalanceModel(lastUpdate: DateTime(1900));
  List<BalanceModel> get balanceHistory => _balanceHistory;

  Future<void> fetchBalance() async {
    _balance = await _accountRepository.getBalance(
      bank: bank,
      agency: agency,
      account: account,
    );
    if (kDebugMode) {
      print('Balance fetched: ${_balance?.balance}');
    }
    notifyListeners();
  }

  Future<void> fetchStatement() async {
    _statement = await _accountRepository.getStatement(
      bank: bank,
      agency: agency,
      account: account,
    );
    notifyListeners();
  }

  Future<void> fetchBalanceHistory() async {
    _balanceHistory = await _accountRepository.getBalanceHistory(
      bank: bank,
      agency: agency,
      account: account,
    );
    notifyListeners();
  }
}
