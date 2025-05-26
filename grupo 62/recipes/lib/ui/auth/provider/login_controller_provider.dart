import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/ui/auth/controller/login_controller.dart';
import 'package:recipes/ui/auth/controller/login_state.dart';

final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>((ref) {
  return LoginController(ref);
});
