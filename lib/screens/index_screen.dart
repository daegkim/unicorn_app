import 'package:flutter/material.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unicorn_app/screens/home/home_screen.dart';
import 'package:unicorn_app/screens/login_screen.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  final Future<SharedPreferences> _sharedPreferences = SharedPreferences.getInstance();

  bool _isLogin = false;

  Future<void> _getLoginInfo() async {
    try {
      final String? userId = (await _sharedPreferences).getString("UNICORN_USER_ID");
      if (userId != null) {
        setState(() {
          _isLogin = true;
        });
      }
      FlutterNativeSplash.remove();
    } catch (e) {
      FlutterNativeSplash.remove();
    }
  }

  void setLogin(bool isLogin, String? userId) async {
    setState(() => _isLogin = isLogin);
    if (isLogin && userId != null) {
      (await _sharedPreferences).setString("UNICORN_USER_ID", userId);
    } else {
      (await _sharedPreferences).remove("UNICORN_USER_ID");
    }
  }

  @override
  void initState() {
    super.initState();
    _getLoginInfo();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLogin) {
      return HomeScreen(setLogin: setLogin);
    } else {
      return LoginScreen(setLogin: setLogin);
    }
  }
}
