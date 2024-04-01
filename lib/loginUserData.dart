import 'package:flutter/material.dart';

class LoginUserData extends ChangeNotifier {
  var userData = {};

  setUserData(data) {
    userData = data;
  }

  getUserData() {
    return userData;
  }
}