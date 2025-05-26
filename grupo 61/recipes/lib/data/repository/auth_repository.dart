import 'package:firebase_auth/firebase_auth.dart';
import 'package:recipes/domain/datasource/auth_datasource.dart';
import 'package:recipes/domain/model/login_params.dart';

class AuthRepository {
  final AuthDatasource _authDatasource;

  AuthRepository(this._authDatasource);

  // TODO llevar este metodo al datasource - malo
  Stream<User?> get authStateChange => FirebaseAuth.instance.idTokenChanges();

  // TODO no usar modelo de firebase - regular
  Future<User?> login(LoginParams loginParams) async {
    return _authDatasource.login(
      loginParams.email,
      loginParams.password,
    );
  }

  Future<void> logout() async {
    // Caso ideal
    _authDatasource.logout();
  }
}
