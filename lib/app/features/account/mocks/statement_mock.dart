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
      name: 'Luiz Nono Silva',
      type: 'CREDIT',
      value: 320,
      createdAt: DateTime.now(),
    ),
    TransactionModel(
      id: '2',
      name: 'Ana Maria',
      type: 'DEBIT',
      value: 700,
      createdAt: DateTime.now(),
    ),
    TransactionModel(
      id: '3',
      name: 'João da Silva',
      type: 'CREDIT',
      value: 654,
      createdAt: DateTime.now(),
    ),
    TransactionModel(
      id: '4',
      name: 'João da Silva',
      type: 'CREDIT',
      value: 1002,
      createdAt: DateTime.now(),
    ),
    TransactionModel(
      id: '5',
      name: 'João da Silva',
      type: 'DEBIT',
      value: 34,
      createdAt: DateTime.now(),
    ),
    TransactionModel(
      id: '6',
      name: 'João da Silva',
      type: 'CREDIT',
      value: 983,
      createdAt: DateTime.now(),
    ),
  ],
  correlationId: '789e4567-e89b-12d3-a456-426614174999',
);
