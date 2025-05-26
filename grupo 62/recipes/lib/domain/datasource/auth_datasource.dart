import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDatasource {
  Future<User?> login(String email, String password);
  Future<void> logout();
}

// TODO no usar el modelo de usario de firebase
