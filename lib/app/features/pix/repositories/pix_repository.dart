import '../models/pix_key_model.dart';
import '../models/pix_model.dart';

abstract class PixRepository {
  /// O método [sendPix] envia um PIX para a chave especificada com o valor informado.
  Future<void> sendPix(PixModel pix);

  /// O método [requestPix] solicita um PIX para a chave especificada com o valor informado.
  Future<void> requestPix(String key, double amount);

  /// O método [validatePixKey] valida se a chave PIX informada é válida.
  Future<bool> validatePixKey(String key, String type);

  /// O método [getPixKeys] retorna as chaves PIX do usuário.
  Future<List<PixKeyModel>> getPixKeys();

  /// O método [addPixKey] adiciona uma nova chave PIX ao usuário.
  Future<void> addPixKey(PixKeyModel pixKey);

  // /// O método [getPixHistory] retorna o histórico de transações PIX do usuário.
  // Future<List<Map<String, dynamic>>> getPixHistory();
}
