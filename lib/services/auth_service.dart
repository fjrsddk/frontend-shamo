import 'dart:convert';
import 'package:shamo/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'http://149.129.215.118:8000/api';

  Future<UserModel?> register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    var url = Uri.parse('$baseUrl/register');
    var headers = {'Content-type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });

    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'];
      if (data['access_token'] != null) {
        UserModel user = UserModel.fromJson(data['user']);
        user.token = 'Bearer ' + data['access_token'];
        return user;
      } else {
        return null;
      }
    } else {
      throw Exception('Gagal Registrasi');
    }
  }

  Future<UserModel?> login({
    required String email,
    required String password,
  }) async {
    var url = Uri.parse('$baseUrl/login');
    var headers = {'Content-type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'];
      if (data['access_token'] != null) {
        UserModel user = UserModel.fromJson(data['user']);
        user.token = 'Bearer ' + data['access_token'];
        return user;
      } else {
        return null;
      }
    } else {
      throw Exception('Gagal Login');
    }
  }
}
