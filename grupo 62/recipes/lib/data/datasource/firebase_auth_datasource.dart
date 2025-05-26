import 'package:firebase_auth/firebase_auth.dart';
import 'package:recipes/domain/datasource/auth_datasource.dart';

class FirebaseAuthDatasource extends AuthDatasource {
  final FirebaseAuth _auth;
  FirebaseAuthDatasource(this._auth);

  @override
  Future<User?> login(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return null;
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }
}
