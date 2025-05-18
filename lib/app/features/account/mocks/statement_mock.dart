import '../models/statement_model.dart';
import '../models/transaction_model.dart';

final statementMock = StatementModel(
  accountNumber: '456',
  agencyNumber: 1,
  cpf: '97786149031',
  name: 'LUIZ NONO SILVA',
  balance: 10000,
  currentBalance: 10000,
  transactions: [
    TransactionModel(
      id: '1',
      type: 'CREDIT',
      value: 1000,
      createdAt: DateTime.now(),
    ),
    TransactionModel(
      id: '2',
      type: 'DEBIT',
      value: 1000,
      createdAt: DateTime.now(),
    ),
  ],
  correlationId: '789e4567-e89b-12d3-a456-426614174999',
);
