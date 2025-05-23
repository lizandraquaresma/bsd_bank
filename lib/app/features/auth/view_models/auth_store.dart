import 'package:flutter/material.dart';

import '../../user/models/user_model.dart';
import '../models/login_dto.dart';
import '../models/register_dto.dart';
import '../repositories/auth_repository.dart';

class AuthStore extends ChangeNotifier {
  AuthStore(this._repository);
  final AuthRepository _repository;

  /// Verifica se o usuário está logado.
  bool get isLogged => _repository.isLogged;

  /// Checa se o usuário está logado e seta o estado global do usuário.
  Future<bool> check() async {
    return isLogged;
  }

  Future<UserModel> login(LoginDto dto) async {
    return _repository.login(dto);
  }

  Future<void> register(RegisterDto dto) async {
    await _repository.register(dto);
  }

  Future<void> logout() async {
    await _repository.logout();
  }
}
