import 'package:firebase_auth/firebase_auth.dart';
import 'package:recipes/domain/datasource/auth_datasource.dart';
import 'package:recipes/domain/model/login_params.dart';

class AuthRepository {
  final AuthDatasource _authDatasource;
  AuthRepository(this._authDatasource);

  // Caso mal planteado
  Stream<User?> get authStateChange => FirebaseAuth.instance.idTokenChanges();

  // Caso con acoplamiento
  Future<User?> login(LoginParams loginParams) async {
    return _authDatasource.login(loginParams.email, loginParams.password);
  }

  // Caso ideal
  Future<void> logout() async {
    _authDatasource.logout();
  }
}
