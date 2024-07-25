import 'package:injectable/injectable.dart';
import '../../../../feature/application/blocs/auth/auth_command.dart';
import '../../../../core/core.dart';
import '../../../application/application.dart';
import 'auth.dart';

@injectable
class AuthBloc extends BaseBloc<AuthState> {
  final LoginUser loginUser;
  final RegisterUser registerUser;

  AuthBloc(this.loginUser, this.registerUser) : super(const AuthState());

  void login({required String userName, required String password}) async {
    command = ShowLoadingCommand();

    final either = await loginUser
        .execute(LoginUserParams(username: userName, password: password));
    command = DismissLoadingCommand();

    either.fold((l) {
      command = ErrorDialogCommand(l.errorMessage);
    }, (r) {
      command = LoginSuccessCommand();
    });
  }

  void register({required String userName, required String password}) async {
    command = ShowLoadingCommand();

    final either = await registerUser
        .execute(RegisterUserParams(username: userName, password: password));
    command = DismissLoadingCommand();

    either.fold((l) {
      command = ErrorDialogCommand(l.errorMessage);
    }, (r) {
      command = LoginSuccessCommand();
    });
  }
}
