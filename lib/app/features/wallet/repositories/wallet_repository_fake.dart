import '../models/card_model.dart';
import 'wallet_repository.dart';

class WalletRepositoryFake implements WalletRepository {
  @override
  Future<List<CardModel>> getCards() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      const CardModel(
        id: '1',
        number: '4111111111111111',
        holderName: 'João Silva',
        expirationDate: '12/25',
        cvv: '123',
        limit: 5000,
        availableLimit: 3500,
        type: CardType.credit,
        isActive: true,
      ),
      const CardModel(
        id: '2',
        number: '5555555555554444',
        holderName: 'Joãozinho da Silva',
        expirationDate: '12/25',
        cvv: '123',
        limit: 0,
        availableLimit: 0,
        type: CardType.debit,
        isActive: true,
      ),
    ];
  }

  @override
  Future<CardModel> getCard(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    
    return CardModel(
      id: id,
      number: '4111111111111111',
      holderName: 'João Silva',
      expirationDate: '12/25',
      cvv: '123',
      limit: 5000,
      availableLimit: 3500,
      type: CardType.credit,
      isActive: true,
    );
  }

  @override
  Future<void> blockCard(String id) async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> unblockCard(String id) async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
