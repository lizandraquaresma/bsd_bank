import '../../../services/api/dio_service.dart';
import '../models/card_model.dart';
import 'wallet_repository.dart';

class WalletRepositoryImpl implements WalletRepository {
  WalletRepositoryImpl({required this.dio});

  final DioService dio;

  @override
  Future<List<CardModel>> getCards() async {
    const path = '/api/cards';
    final response = await dio.get(path);

    return (response.data as List)
        .map((json) => CardModel.fromMap(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<CardModel> getCard(String id) async {
    final path = '/api/cards/$id';
    final response = await dio.get(path);

    return CardModel.fromMap(response.data as Map<String, dynamic>);
  }

  @override
  Future<void> blockCard(String id) async {
    final path = '/api/cards/$id/block';
    await dio.post(path);
  }

  @override
  Future<void> unblockCard(String id) async {
    final path = '/api/cards/$id/unblock';
    await dio.post(path);
  }
}
