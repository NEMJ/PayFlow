import 'package:flutter/material.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  var _isAuthenticated = false;
  UserModel? _user;

  UserModel get user => user!;

  void setUser(BuildContext context, UserModel? user) {
    if(user != null){
      user = user;
      _isAuthenticated = true;
      Navigator.pushReplacementNamed(context,"/home");
    } else {
      _isAuthenticated = false;
      Navigator.pushReplacementNamed(context,"login");
    }
  }

  Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString("user", user.toJson());
    return;
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    final json = await instance.get("user") as String;
    setUser(context, UserModel.fromJson(json));
    return;
  }
}