import '../models/authenticate_model.dart';
import '../models/balance_model.dart';
import '../models/statement_model.dart';
import 'account_repository.dart';

class AccountRepositoryFake extends AccountRepository {
  final balanceMock = BalanceModel(
    agencyNumber: 1,
    accountNumber: '456',
    cpf: '12345678901',
    name: 'John Doe',
    balance: 1000.0,
    formattedBalance: r'R$ 1.000,00',
    lastUpdate: DateTime.now(),
    correlationId: '1234567890',
  );

  @override
  Future<AuthenticateModel> authenticate() async {
    return const AuthenticateModel(
      originalTransactionId: '123',
      agencyNumber: 1,
      accountNumber: '456',
      cardPassword: 'password',
    );
  }

  @override
  Future<BalanceModel> getBalance({
    required int bank,
    required int agency,
    required String account,
  }) async {
    return balanceMock;
  }

  @override
  Future<List<StatementModel>> getStatement({
    required int bank,
    required int agency,
    required String account,
  }) async {
    return [
      StatementModel(
        id: '1',
        accountNumber: '456',
        agencyNumber: 1,
        amount: 100.0,
        date: DateTime.now(),
      ),
      StatementModel(
        id: '2',
        accountNumber: '456',
        agencyNumber: 1,
        amount: 200.0,
        date: DateTime.now(),
      ),
    ];
  }

  @override
  Future<List<BalanceModel>> getBalancesHistory({
    required int bank,
    required int agency,
    required String account,
  }) async {
    return [
      BalanceModel(
        agencyNumber: 1,
        accountNumber: '456',
        cpf: '12345678901',
        name: 'John Doe',
        balance: 1000.0,
        formattedBalance: r'R$ 1.000,00',
        lastUpdate: DateTime(2000, 2, 2),
        correlationId: '1234567890',
      ),
      BalanceModel(
        agencyNumber: 1,
        accountNumber: '456',
        cpf: '12345678901',
        name: 'John Doe',
        balance: 2000.0,
        formattedBalance: r'R$ 2.000,00',
        lastUpdate: DateTime(2000),
        correlationId: '1234567890',
      ),
    ];
  }
}
