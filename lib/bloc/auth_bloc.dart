// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

// Durumlar (States)
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {}

class AuthUnauthenticated extends AuthState {}

// Olaylar (Events)
abstract class AuthEvent {}

class AppStarted extends AuthEvent {}

class LoggedIn extends AuthEvent {}

class LoggedOut extends AuthEvent {}

// BLoC
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AppStarted) {
      // Uygulama başladığında oturum durumunu kontrol et
      // Eğer oturum açıksa AuthAuthenticated, değilse AuthUnauthenticated durumunu gönder
    } else if (event is LoggedIn) {
      // Oturum açma işlemi gerçekleştiğinde AuthAuthenticated durumunu gönder
    } else if (event is LoggedOut) {
      // Oturum kapatma işlemi gerçekleştiğinde AuthUnauthenticated durumunu gönder
    }
  }
}
