import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/controller/login_state.dart';
import 'package:recipes/domain/model/login_params.dart';
import 'package:recipes/provider/repository_provider.dart';

class LoginController extends StateNotifier<LoginState> {
  final Ref ref;

  LoginController(this.ref) : super(const LoginStateInitial());

  void login(String email, String password) async {
    state = const LoginStateLoading();
    try {
      await ref
          .read(authRepositoryProvider)
          .login(LoginParams(email: email, password: password));
      state = const LoginStateSuccess();
    } catch (exc) {
      state = LoginStateError(exc.toString());
    }
  }

  void logout() async {
    await ref.read(authRepositoryProvider).logout();
  }
}
