import '../models/card_model.dart';

abstract class WalletRepository {
  Future<List<CardModel>> getCards();
  Future<CardModel> getCard(String id);
  Future<void> blockCard(String id);
  Future<void> unblockCard(String id);
}
