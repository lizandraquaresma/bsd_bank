import 'package:flutter/foundation.dart';

@immutable
class CardModel {
  const CardModel({
    required this.id,
    required this.number,
    required this.holderName,
    required this.expirationDate,
    required this.cvv,
    required this.limit,
    required this.availableLimit,
    required this.type,
    required this.isActive,
  });

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      id: map['id'] as String,
      number: map['number'] as String,
      holderName: map['holderName'] as String,
      expirationDate: map['expirationDate'] as String,
      cvv: map['cvv'] as String,
      limit: (map['limit'] as num).toDouble(),
      availableLimit: (map['availableLimit'] as num).toDouble(),
      type: CardType.values.firstWhere(
        (e) => e.name == map['type'],
        orElse: () => CardType.credit,
      ),
      isActive: map['isActive'] as bool,
    );
  }

  final String id;
  final String number;
  final String holderName;
  final String expirationDate;
  final String cvv;
  final double limit;
  final double availableLimit;
  final CardType type;
  final bool isActive;

  CardModel copyWith({
    String? id,
    String? number,
    String? holderName,
    String? expirationDate,
    String? cvv,
    double? limit,
    double? availableLimit,
    CardType? type,
    bool? isActive,
  }) {
    return CardModel(
      id: id ?? this.id,
      number: number ?? this.number,
      holderName: holderName ?? this.holderName,
      expirationDate: expirationDate ?? this.expirationDate,
      cvv: cvv ?? this.cvv,
      limit: limit ?? this.limit,
      availableLimit: availableLimit ?? this.availableLimit,
      type: type ?? this.type,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'number': number,
      'holderName': holderName,
      'expirationDate': expirationDate,
      'cvv': cvv,
      'limit': limit,
      'availableLimit': availableLimit,
      'type': type.name,
      'isActive': isActive,
    };
  }

  @override
  String toString() {
    return 'CardModel(id: $id, number: $number, holderName: $holderName, expirationDate: $expirationDate, cvv: $cvv, limit: $limit, availableLimit: $availableLimit, type: $type, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CardModel &&
        other.id == id &&
        other.number == number &&
        other.holderName == holderName &&
        other.expirationDate == expirationDate &&
        other.cvv == cvv &&
        other.limit == limit &&
        other.availableLimit == availableLimit &&
        other.type == type &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        number.hashCode ^
        holderName.hashCode ^
        expirationDate.hashCode ^
        cvv.hashCode ^
        limit.hashCode ^
        availableLimit.hashCode ^
        type.hashCode ^
        isActive.hashCode;
  }
}

enum CardType {
  credit,
  debit,
}
