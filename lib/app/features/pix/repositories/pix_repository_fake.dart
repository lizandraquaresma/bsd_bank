import '../mocks/pix_key_mock.dart';
import '../models/pix_key_model.dart';
import '../models/pix_model.dart';
import 'pix_repository.dart';

class PixRepositoryFake implements PixRepository {
  @override
  Future<void> addPixKey(PixKeyModel pixKey) async => pixKeysMock.add(pixKey);

  @override
  Future<List<PixKeyModel>> getPixKeys() async => pixKeysMock;

  @override
  Future<void> requestPix(String key, double amount) async {
    // Simula uma requisição de PIX
    return Future.delayed(const Duration(seconds: 3));
  }

  @override
  Future<void> sendPix(PixModel pix) async {
    // precisa subtrair o valor do saldo
  }

  @override
  Future<bool> validatePixKey(String key, String type) async {
    return true;
  }
}
