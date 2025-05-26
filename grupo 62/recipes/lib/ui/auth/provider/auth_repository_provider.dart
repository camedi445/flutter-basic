import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/data/datasource/firebase_auth_datasource.dart';
import 'package:recipes/data/repository/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authDatasource = FirebaseAuthDatasource(FirebaseAuth.instance);
  return AuthRepository(authDatasource);
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.read(authRepositoryProvider).authStateChange;
});
