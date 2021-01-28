

import 'package:hoverpayClean/src/domain/entities/user.dart';
import 'package:hoverpayClean/src/domain/services/authentication.dart';

class SignInUseCase {
  AuthenticationService authenticationService;

  SignInUseCase(this.authenticationService);

  Future<User> call(String email, String password) async {
    return await authenticationService.signIn(email, password);
  }
}
