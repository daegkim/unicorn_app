import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unicorn_app/screens/account/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = '/SignInScreen';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();
  final _idTextEditingController = TextEditingController();
  final _pwdTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _idTextEditingController.dispose();
    _pwdTextEditingController.dispose();
  }

  Future<void> _onPressSignInBtn() async {
    if (_idTextEditingController.text.isNotEmpty) {
      SharedPreferences sPreferences = (await sharedPreferences);
      sPreferences.setString("UNICORN_USER_ID", _idTextEditingController.text);
      if (!mounted) {
        sPreferences.remove("UNICORN_USER_ID");
        return;
      }
      await Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
    }
  }
  
  void _clearInputs() {
    FocusScope.of(context).unfocus();
    _idTextEditingController.clear();
    _pwdTextEditingController.clear();
  }

  void _onPressSignUpBtn() async {
    _clearInputs();
    await Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignIn Screen"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 256,
              margin: const EdgeInsets.all(10),
              child: TextField(
                controller: _idTextEditingController,
                decoration: const InputDecoration(
                  labelText: "아이디",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              width: 256,
              margin: const EdgeInsets.all(10),
              child: TextField(
                controller: _pwdTextEditingController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "비밀번호",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: _onPressSignInBtn,
                  child: const Text("로그인"),
                ),
                OutlinedButton(
                  onPressed: _onPressSignUpBtn,
                  child: const Text("회원가입"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
