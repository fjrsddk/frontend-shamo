import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  set user(UserModel? user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      UserModel? user = await AuthService().register(
        name: name,
        username: username,
        email: email,
        password: password,
      );

      if (user != null && user.token != null) {
        _user = user;
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      UserModel? user = await AuthService().login(
        email: email,
        password: password,
      );

      if (user != null && user.token != null) {
        _user = user;
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
