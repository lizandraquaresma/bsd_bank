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
  Future<bool> check() async {
    return isLogged;
  }

  @override
  Future<UserModel> login(LoginDto dto) async {
    const path = '/api/auth/login';

    final response = await dio.post(path, data: dto);

    final token = response.data['token'] as String;
    await cache.set('token', token);

    return UserModel.fromMap(response.data as Map<String, dynamic>);
  }

  @override
  Future<void> logout() async {
    await cache.remove('token');
    dio.token = null;
  }

  @override
  Future<void> register(RegisterDto dto) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
