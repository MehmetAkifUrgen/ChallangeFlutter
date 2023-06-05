import 'package:flutter_bloc/flutter_bloc.dart';

// Kullanıcı durumu için Bloc event ve state sınıflarını tanımlayalım
abstract class UserProfileEvent {}

class UserProfileLoadEvent extends UserProfileEvent {}

abstract class UserProfileState {}

class UserProfileLoadingState extends UserProfileState {}

class UserProfileLoadedState extends UserProfileState {
  final String username;
  final String avatarUrl;

  UserProfileLoadedState(this.username, this.avatarUrl);
}

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc() : super(UserProfileLoadingState());

  Stream<UserProfileState> mapEventToState(UserProfileEvent event) async* {
    if (event is UserProfileLoadEvent) {
      yield UserProfileLoadingState();

      // Kullanıcının bilgilerini burada yükleyin
      await Future.delayed(const Duration(seconds: 2));

      // Örnek veri
      String username = "John Doe";
      String avatarUrl =
          "https://upload.wikimedia.org/wikipedia/tr/1/19/Scarfaceinthefall.jpg";

      yield UserProfileLoadedState(username, avatarUrl);
    }
  }
}
