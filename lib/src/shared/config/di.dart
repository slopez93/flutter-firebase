import 'package:get_it/get_it.dart';
import 'package:hoverpayClean/src/application/usecases/authentication/sign_in.dart';
import 'package:hoverpayClean/src/domain/services/authentication.dart';
import 'package:hoverpayClean/src/infraestructure/services/firebaseAuthentication.dart';
import 'package:hoverpayClean/src/presentation/blocs/login/login_bloc.dart';

final sl = GetIt.I;

void setup() {
  // Blocs
  sl.registerFactory(() => LoginBloc(signInUseCase: sl()));

  // Use cases
  sl.registerLazySingleton(() => SignInUseCase(sl()));

  // Infra services
  sl.registerLazySingleton<AuthenticationService>(
      () => FirebaseAuthentication());
}
