
import '../models/authenticate_model.dart';
import '../models/balance_model.dart';
import '../models/statement_model.dart';

abstract class AccountRepository {
  // O método [getBalance] carrega o saldo da conta.
  Future<BalanceModel> getBalance({
    required int bank,
    required int agency,
    required String account,
  });

  Future<List<BalanceModel>> getBalancesHistory({
    required int bank,
    required int agency,
    required String account,
  });

  // O método [getStatement] carrega o extrato da conta.
  Future<List<StatementModel>> getStatement({
    required int bank,
    required int agency,
    required String account,
  });

  // O método [authenticate] autentica uma transação.
  Future<AuthenticateModel> authenticate();
}
