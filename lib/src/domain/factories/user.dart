import 'package:hoverpayClean/src/domain/entities/user.dart';

class UserFactory {
  static User createUser(email, name) {
    return new User(email, name);
  }
}
