
import '../models/pix_key_model.dart';
import '../models/pix_model.dart';
import 'pix_repository.dart';

class PixRepositoryImpl implements PixRepository{
  @override
  Future<void> addPixKey(PixKeyModel pixKey) {
    // TODO: implement addPixKey
    throw UnimplementedError();
  }

  @override
  Future<List<PixKeyModel>> getPixKeys() {
    // TODO: implement getPixKeys
    throw UnimplementedError();
  }

  @override
  Future<void> requestPix(String key, double amount) {
    // TODO: implement requestPix
    throw UnimplementedError();
  }

  @override
  Future<void> sendPix(PixModel pix) {
    // TODO: implement sendPix
    throw UnimplementedError();
  }

  @override
  Future<bool> validatePixKey(String key, String type) {
    // TODO: implement validatePixKey
    throw UnimplementedError();
  }

}