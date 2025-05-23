import 'package:flutter/material.dart';

import '../models/card_model.dart';
import '../repositories/wallet_repository.dart';

class WalletViewModel extends ChangeNotifier {
  WalletViewModel(this._repository) {
    getCards();
  }

  final WalletRepository _repository;
  List<CardModel> _cards = [];
  var _isLoading = false;
  String? _error;

  List<CardModel> get cards => _cards;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> getCards() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _cards = await _repository.getCards();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> blockCard(String id) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      await _repository.blockCard(id);
      await getCards();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> unblockCard(String id) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      await _repository.unblockCard(id);
      await getCards();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }
}
