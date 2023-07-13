import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../service/api_service.dart';

// State class
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String errorMessage;

  LoginFailure(this.errorMessage);
}

// Event class
abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String emailOrUsername;
  final String password;

  LoginButtonPressed({
    required this.emailOrUsername,
    required this.password,
  });
}

// Bloc class
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiService apiService;

  LoginBloc(this.apiService) : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  void _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    try {
      await apiService.loginUser(
        emailOrUsername: event.emailOrUsername,
        password: event.password,
      );

      emit(LoginSuccess());
    } catch (error) {
      emit(LoginFailure(error.toString()));
    }
  }
}
