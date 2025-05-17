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
    print('AccountViewModel initialized with:');
    print('bank: $bank');
    print('agency: $agency');
    print('account: $account');
    fetchBalance();
    fetchStatement();
  }

  final AccountRepository _accountRepository;
  final int bank;
  final int agency;
  final String account;

  BalanceModel? _balance;

  List<StatementModel> _statement = [];
  List<StatementModel> get statement => _statement;
  BalanceModel get balance =>
      _balance ?? BalanceModel(lastUpdate: DateTime(1900));

  Future<void> fetchBalance() async {
    print('Fetching balance...');
    _balance = await _accountRepository.getBalance(
      bank: bank,
      agency: agency,
      account: account,
    );
    print('Balance fetched: ${_balance?.balance}');
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
}
