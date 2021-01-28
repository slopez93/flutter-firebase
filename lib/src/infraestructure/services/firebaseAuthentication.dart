import 'package:firebase_auth/firebase_auth.dart';
import 'package:hoverpayClean/src/domain/entities/user.dart' as UserEntity;
import 'package:hoverpayClean/src/domain/exceptions/expceptions.dart';
import 'package:hoverpayClean/src/domain/factories/user.dart';
import 'package:hoverpayClean/src/domain/services/authentication.dart';

class FirebaseAuthentication implements AuthenticationService {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<UserEntity.User> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return UserFactory.createUser(email, userCredential.user.displayName);
    } catch (e) {
      throw UserNotFound(e.message);
    }
  }
}
