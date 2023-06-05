import 'package:flutter_bloc/flutter_bloc.dart';

// Register Events
abstract class RegisterEvent {}

class UsernameChanged extends RegisterEvent {
  final String username;

  UsernameChanged(this.username);
}

class EmailChanged extends RegisterEvent {
  final String email;

  EmailChanged(this.email);
}

class NameChanged extends RegisterEvent {
  final String name;

  NameChanged(this.name);
}

class SurnameChanged extends RegisterEvent {
  final String surname;

  SurnameChanged(this.surname);
}

class PasswordChanged extends RegisterEvent {
  final String password;

  PasswordChanged(this.password);
}

class RegisterButtonPressed extends RegisterEvent {}

// Register States
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String error;

  RegisterFailure(this.error);
}

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<UsernameChanged>((event, emit) {
      // Kullanıcı adı değiştiğinde yapılacak işlemler
    });

    on<PasswordChanged>((event, emit) {
      // Parola değiştiğinde yapılacak işlemler
    });
    on<SurnameChanged>((event, emit) {});
    on<EmailChanged>((event, emit) {});
    on<NameChanged>((event, emit) {});
    on<RegisterButtonPressed>((event, emit) {});
  }

  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is UsernameChanged) {
      // Handle username change event
      yield state; // You can add additional logic here
    } else if (event is EmailChanged) {
      // Handle email change event
      yield state; // You can add additional logic here
    } else if (event is PasswordChanged) {
      // Handle password change event
      yield state; // You can add additional logic here
    } else if (event is RegisterButtonPressed) {
      yield RegisterLoading();

      try {
        // Perform registration logic here
        await Future.delayed(const Duration(seconds: 2));

        // Simulate success response
        yield RegisterSuccess();
      } catch (error) {
        // Handle error
        yield RegisterFailure(error.toString());
      }
    }
  }
}
