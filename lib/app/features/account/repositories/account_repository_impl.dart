import '../models/authenticate_model.dart';
import '../models/balance_model.dart';
import '../models/statement_model.dart';
import 'account_repository.dart';

class AccountRepositoryImpl extends AccountRepository {
  @override
  Future<AuthenticateModel> authenticate() {
    // TODO: implement authenticate
    throw UnimplementedError();
  }

  @override
  Future<BalanceModel> getBalance({
    required int bank,
    required int agency,
    required String account,
  }) {
    // TODO: implement getBalance
    throw UnimplementedError();
  }

  @override
  Future<StatementModel> getStatement({
    required int bank,
    required int agency,
    required String account,
  }) {
    // TODO: implement getStatement
    throw UnimplementedError();
  }

  @override
  Future<List<BalanceModel>> getBalanceHistory({
    required int bank,
    required int agency,
    required String account,
  }) {
    // TODO: implement getBalancesHistory
    throw UnimplementedError();
  }
}
