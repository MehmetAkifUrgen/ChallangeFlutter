import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
                            const CustomNavigationBar(), // Ana sayfa widget'ı
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
                    onSubmit: () {
                      final registerBloc =
                          BlocProvider.of<RegisterBloc>(context);
                      registerBloc.add(RegisterButtonPressed(
                        username: _usernameController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                        firstName: _firstNameController.text,
                        lastName: _lastNameController.text,
                        phoneNumber: _phoneNumberController.text,
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
  final VoidCallback onSubmit;

  RegisterForm({
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
    required this.firstNameController,
    required this.lastNameController,
    required this.phoneNumberController,
    required this.onSubmit,
  });

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
            controller: phoneNumberController,
            keyboardType: TextInputType.phone,
            onChanged: (value) {},
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
            onPressed: onSubmit,
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
