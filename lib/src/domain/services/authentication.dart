import 'package:hoverpayClean/src/domain/entities/user.dart';

abstract class AuthenticationService {
  Future<User> signIn(String email, String password);
}
