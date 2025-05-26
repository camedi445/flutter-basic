import 'package:firebase_auth/firebase_auth.dart';
import 'package:recipes/domain/datasource/auth_datasource.dart';

class FirebaseServiceDatasource extends AuthDatasource {
  final FirebaseAuth _auth;

  FirebaseServiceDatasource(this._auth);

  @override
  Future<User?> login(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user; // TODO mapear este usaurio a un usuario del dominio
    } on FirebaseAuthException catch (exception) {
      if (exception.code == 'user-not-found') {
        // TODO gestionar la excepcion concreta
      } else if (exception.code == 'wrong-password') {
        // TODO gestionar la excepcion concreta
      }
    }
    return null;
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }
}
