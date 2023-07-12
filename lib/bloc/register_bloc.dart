import 'package:bloc/bloc.dart';
import '../service/api_service.dart';

// State class
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String errorMessage;

  RegisterFailure(this.errorMessage);
}

// Event class
abstract class RegisterEvent {}

class RegisterButtonPressed extends RegisterEvent {
  final String username;
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phoneNumber;

  RegisterButtonPressed({
    required this.username,
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  });
}

// Bloc class
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final ApiService apiService;

  RegisterBloc(this.apiService) : super(RegisterInitial()) {
    on<RegisterButtonPressed>(_onRegisterButtonPressed);
  }

  void _onRegisterButtonPressed(
    RegisterButtonPressed event,
    Emitter<RegisterState> emit,
  ) async {
    emit(RegisterLoading());

    try {
      await apiService.registerUser(
        username: event.username,
        email: event.email,
        password: event.password,
        firstName: event.firstName,
        lastName: event.lastName,
        phoneNumber: event.phoneNumber,
      );

      emit(RegisterSuccess());
    } catch (error) {
      emit(RegisterFailure(error.toString()));
    }
  }
}
