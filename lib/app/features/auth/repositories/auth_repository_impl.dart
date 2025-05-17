
import '../../../services/api/dio_service.dart';
import '../../../services/cache/cache_service.dart';
import '../../user/models/user_model.dart';
import '../models/login_dto.dart';
import '../models/register_dto.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.dio, required this.cache});

  final DioService dio;
  final CacheService cache;

  @override
  bool get isLogged {
    dio.token = cache.get('token');

    return dio.token != null;
  }

  @override
  Future<bool> check() {
    // TODO: implement check
    throw UnimplementedError();
  }

  @override
  Future<UserModel> login(LoginDto dto) async {
    const path = '/api/auth/login';

    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> register(RegisterDto dto) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
