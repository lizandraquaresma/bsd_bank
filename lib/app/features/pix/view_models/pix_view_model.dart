import 'package:flutter/foundation.dart';

import '../models/pix_key_model.dart';
import '../models/pix_model.dart';
import '../repositories/pix_repository.dart';

class PixViewModel extends ChangeNotifier {
  PixViewModel(this._pixRepository){
    getPixKeys();
  }

  final PixRepository _pixRepository;

  List<PixKeyModel> _pixKeys = [];
  List<PixKeyModel> get pixKeys => _pixKeys;

  Future<void> getPixKeys() async {
    _pixKeys = await _pixRepository.getPixKeys();
    notifyListeners();
  }

  Future<void> addPixKey(PixKeyModel key) async {
    await _pixRepository.addPixKey(key);
    await getPixKeys();
  }

  Future<bool> validatePixKey(String key, String type) =>
      _pixRepository.validatePixKey(key, type);

  Future<void> sendPix(PixModel pix) => _pixRepository.sendPix(pix);

  Future<void> requestPix(String key, double amount) =>
      _pixRepository.requestPix(key, amount);

  @override
  void dispose() {
    _pixKeys.clear();
    super.dispose();
  }
}
