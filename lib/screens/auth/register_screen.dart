import 'dart:math';

import 'package:deneme_p/screens/auth/login_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../main.dart';
import '/bloc/register_bloc.dart';
import '/service/api_service.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _formattedPhoneNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (context) => RegisterBloc(ApiService()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.red,
                  Colors.orange,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: const Text('Kayıt Ol'),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(color: Colors.white),
          child: Center(
            child: SingleChildScrollView(
              child: BlocConsumer<RegisterBloc, RegisterState>(
                listener: (context, state) {
                  if (state is RegisterSuccess) {
                    // Kayıt işlemi başarılı
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const LoginPage(), // Ana sayfa widget'ı
                      ),
                    );
                  } else if (state is RegisterFailure) {
                    // Kayıt işlemi başarısız
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Hata'),
                          content: Text(state.errorMessage),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Tamam'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                builder: (context, state) {
                  return RegisterForm(
                    usernameController: _usernameController,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    firstNameController: _firstNameController,
                    lastNameController: _lastNameController,
                    phoneNumberController: _phoneNumberController,
                    formattedPhoneNumberController:
                        _formattedPhoneNumberController,
                    onSubmit: () {
                      final registerBloc =
                          BlocProvider.of<RegisterBloc>(context);
                      registerBloc.add(RegisterButtonPressed(
                        username: _usernameController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                        firstName: _firstNameController.text,
                        lastName: _lastNameController.text,
                        phoneNumber: _formattedPhoneNumberController.text
                            .replaceAll('-', ''),
                      ));
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController phoneNumberController;
  final TextEditingController formattedPhoneNumberController;
  final VoidCallback onSubmit;

  RegisterForm({
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
    required this.firstNameController,
    required this.lastNameController,
    required this.phoneNumberController,
    required this.formattedPhoneNumberController,
    required this.onSubmit,
  });

  void _formatPhoneNumber(String text) {
    final previousCursorPosition = phoneNumberController.selection.baseOffset;

    final formatted = StringBuffer();
    var cursorPosition = 0;

    final digitsOnly =
        text.replaceAll(RegExp(r'\D'), ''); // Remove non-digit characters

    if (digitsOnly.length >= 3) {
      formatted.write(digitsOnly.substring(0, 3));
      cursorPosition += 3;
    } else {
      formatted.write(digitsOnly);
      cursorPosition += digitsOnly.length;
    }

    if (digitsOnly.length > 3) {
      formatted.write('-');

      if (digitsOnly.length >= 6) {
        formatted.write(digitsOnly.substring(3, 6));
        cursorPosition += 4;
      } else {
        formatted.write(digitsOnly.substring(3));
        cursorPosition += digitsOnly.length + 1;
      }
    }

    if (digitsOnly.length > 6) {
      formatted.write('-');

      if (digitsOnly.length >= 8) {
        formatted.write(digitsOnly.substring(6, 8));
        cursorPosition += 3;
      } else {
        formatted.write(digitsOnly.substring(6));
        cursorPosition += digitsOnly.length + 1;
      }
    }

    if (digitsOnly.length > 8) {
      formatted.write('-');
      formatted.write(digitsOnly.substring(8));
      cursorPosition += digitsOnly.length + 1;
    }

    phoneNumberController.text = formatted.toString();

    phoneNumberController.selection = TextSelection.fromPosition(
      TextPosition(offset: min(cursorPosition, formatted.length)),
    );
  }

  void _validateAndSubmit(BuildContext context) {
    final firstName = firstNameController.text.trim();
    final lastName = lastNameController.text.trim();
    final email = emailController.text.trim();
    final phoneNumber = formattedPhoneNumberController.text.replaceAll('-', '');
    final username = usernameController.text.trim();
    final password = passwordController.text;

    if (firstName.isEmpty ||
        lastName.isEmpty ||
        email.isEmpty ||
        phoneNumber.isEmpty ||
        username.isEmpty ||
        password.isEmpty) {
      _showErrorMessage(context, 'Tüm alanları doldurun.');
      return;
    }

    if (firstName.length < 3 ||
        lastName.length < 3 ||
        username.length < 3 ||
        phoneNumber.length < 11) {
      _showErrorMessage(context,
          'Ad, Soyad, Kullanıcı Adı ve Telefon No en az 3 karakter olmalıdır.');
      return;
    }

    if (password.length < 8) {
      _showErrorMessage(context, 'Parola en az 8 karakter olmalıdır.');
      return;
    }

    // All validations passed, call the onSubmit callback
    onSubmit();
  }

  void _showErrorMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hata'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Tamam'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: firstNameController,
            onChanged: (value) {},
            decoration: InputDecoration(
              labelStyle: const TextStyle(color: Colors.black),
              labelText: 'Ad',
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: lastNameController,
            onChanged: (value) {},
            decoration: InputDecoration(
              labelStyle: const TextStyle(color: Colors.black),
              labelText: 'Soy Adı',
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {},
            decoration: InputDecoration(
              labelStyle: const TextStyle(color: Colors.black),
              labelText: 'Email',
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: formattedPhoneNumberController,
            keyboardType: TextInputType.phone,
            onChanged: _formatPhoneNumber,
            inputFormatters: [
              LengthLimitingTextInputFormatter(
                  14), // Limit to a maximum of 14 characters
            ],
            decoration: InputDecoration(
              labelStyle: const TextStyle(color: Colors.black),
              labelText: 'Telefon No',
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: usernameController,
            onChanged: (value) {},
            decoration: InputDecoration(
              labelStyle: const TextStyle(color: Colors.black),
              labelText: 'Kullanıcı Adı',
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: passwordController,
            obscureText: true,
            onChanged: (value) {},
            decoration: InputDecoration(
              labelText: 'Parola',
              labelStyle: const TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => _validateAndSubmit(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
            ),
            child: const Text(
              'Kayıt Ol',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
