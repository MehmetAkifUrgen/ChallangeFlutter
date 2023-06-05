// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

// Durumlar (States)
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure({required this.error});
}

// Olaylar (Events)
abstract class LoginEvent {}

class UsernameChanged extends LoginEvent {
  final String username;

  UsernameChanged(this.username);
}

class PasswordChanged extends LoginEvent {
  final String password;

  PasswordChanged(this.password);
}

class LoginButtonPressed extends LoginEvent {}

// BLoC
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<UsernameChanged>((event, emit) {
      // Kullanıcı adı değiştiğinde yapılacak işlemler
    });

    on<PasswordChanged>((event, emit) {
      // Parola değiştiğinde yapılacak işlemler
    });
    on<LoginButtonPressed>((event, emit) {
     
      // Giriş butonuna basılma olayını işle
      // Burada giriş işlemini gerçekleştir ve uygun durumu yayınla
    });
  }
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is UsernameChanged) {
      // Kullanıcı adı değişikliği olayı
      yield LoginLoading();
      // Kullanıcı adı geçerlilik kontrolü vb. işlemler yapılabilir
    } else if (event is PasswordChanged) {
      // Parola değişikliği olayı
      yield LoginLoading();
      // Parola geçerlilik kontrolü vb. işlemler yapılabilir
    } else if (event is LoginButtonPressed) {
      
      // Giriş butonuna basılma olayı
      yield LoginLoading();
      try {
        // Giriş işlemini gerçekleştir
        // Eğer başarılıysa LoginSuccess, başarısızsa LoginFailure durumunu gönder
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
