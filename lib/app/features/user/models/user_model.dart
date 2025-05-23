// Generated by Dart Safe Data Class Generator. * Change this header on extension settings *
// ignore_for_file: type=lint
import 'dart:convert';

import 'package:flutter/foundation.dart';

// "name": "João Silva",
//   "cpf": "12345678900",
//   "bankNumber": 1,
//   "agencyNumber": 1234,
//   "accountNumber": "123456-7",
//   "correlationId": "550e8400-e29b-41d4-a716-446655440000"

@immutable
class UserModel {
  const UserModel({
    this.name = '',
    this.cpf = '',
    this.bankNumber = 0,
    this.agencyNumber = 0,
    this.accountNumber = '',
    this.correlationId = '',
  });

  final String name;
  final String cpf;
  final int bankNumber;
  final int agencyNumber;
  final String accountNumber;
  final String correlationId;

  UserModel copyWith({
    String? name,
    String? cpf,
    int? bankNumber,
    int? agencyNumber,
    String? accountNumber,
    String? correlationId,
  }) {
    return UserModel(
      name: name ?? this.name,
      cpf: cpf ?? this.cpf,
      bankNumber: bankNumber ?? this.bankNumber,
      agencyNumber: agencyNumber ?? this.agencyNumber,
      accountNumber: accountNumber ?? this.accountNumber,
      correlationId: correlationId ?? this.correlationId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'cpf': cpf,
      'bankNumber': bankNumber,
      'agencyNumber': agencyNumber,
      'accountNumber': accountNumber,
      'correlationId': correlationId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
     T cast<T>(String k) => map[k] is T ? map[k] as T : throw ArgumentError.value(map[k], k, '$T ← ${map[k].runtimeType}');
    return UserModel(
      name: cast<String>('name'),
      cpf: cast<String>('cpf'),
      bankNumber: cast<num>('bankNumber').toInt(),
      agencyNumber: cast<num>('agencyNumber').toInt(),
      accountNumber: cast<String>('accountNumber'),
      correlationId: cast<String>('correlationId'),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(name: $name, cpf: $cpf, bankNumber: $bankNumber, agencyNumber: $agencyNumber, accountNumber: $accountNumber, correlationId: $correlationId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.name == name &&
      other.cpf == cpf &&
      other.bankNumber == bankNumber &&
      other.agencyNumber == agencyNumber &&
      other.accountNumber == accountNumber &&
      other.correlationId == correlationId;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      cpf.hashCode ^
      bankNumber.hashCode ^
      agencyNumber.hashCode ^
      accountNumber.hashCode ^
      correlationId.hashCode;
  }
}
