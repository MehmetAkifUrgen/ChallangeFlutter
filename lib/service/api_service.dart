// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class ApiService {
  final Dio _dio;

  ApiService() : _dio = Dio() {
    // ignore: deprecated_member_use
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    _dio.options.baseUrl = 'https://10.1.23.200:7107/api/';
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'TenantId': 'public',
    };
  }

  Future<void> registerUser({
    String? username,
    String? email,
    String? password,
    String? firstName,
    String? lastName,
    String? phoneNumber,
  }) async {
    try {
      final response = await _dio.post(
        'auth/register',
        data: {
          'username': username,
          'email': email,
          'password': password,
          'firstName': firstName,
          'lastName': lastName,
          'phoneNumber': phoneNumber,
        },
      );
      var data = response.statusMessage;
      if (response.statusCode == 200) {
        // Başarılı bir şekilde kayıt işlemi gerçekleşti
        print('Kayıt işlemi başarılı');
      } else {
        // Kayıt işlemi başarısız oldu
        throw Exception('Kayıt işlemi başarısız: $data');
      }
    } catch (error) {
      // Hata oluştu
      throw Exception('Giriş işlemi başarısız: $error');
    }
  }

  Future<void> loginUser({
    String? emailOrUsername,
    String? password,
  }) async {
    try {
      final response = await _dio.post(
        'auth/login',
        data: {
          'emailOrUsername': emailOrUsername,
          'password': password,
        },
      );

      var data = response.statusMessage;

      if (response.statusCode == 200) {
        // Post işlemi başarılı
        print('Giriş işlemi başarılı: $data');
      } else {
        // Post işlemi başarısız
        throw Exception('Giriş işlemi başarısız: $data');
      }
    } catch (error) {
      // Hata oluştu
      throw Exception('Giriş işlemi başarısız: $error');
    }
  }
}
