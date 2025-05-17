import '../models/user_model.dart';
import 'user_repository.dart';

class UserRepositoryFake implements UserRepository {
  var _user = const UserModel(
    correlationId: '42',
    name: 'Abraão Vieira',
    cpf: '12345678900',
    bankNumber: 1,
    agencyNumber: 1234,
    accountNumber: '123456-7',
  );

  @override
  Future<UserModel> getUser() async {
    return _user;
  }

  @override
  Future<void> updateUser(UserModel user) async {
    _user = user;
  }
}
