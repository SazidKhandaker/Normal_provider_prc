import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class Modelclass with ChangeNotifier {
  bool _themdata = false;

  bool get themdata => _themdata;

  set dataset(bool value) {
    _themdata = value;
    setdata(value);
  }

  static setdata(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("sazid", value);
  }

  static getdata() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool("sazid") ?? false;
  }
}
