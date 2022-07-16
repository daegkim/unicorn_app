import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final Function(bool isLogin, String? userId) setLogin;
  const LoginScreen({Key? key, required this.setLogin}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

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

  Future<void> onPressLoginBtn() async {
    if (_idTextEditingController.text.isNotEmpty) {
      widget.setLogin(true, _idTextEditingController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
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
          OutlinedButton(
            onPressed: onPressLoginBtn,
            child: const Text("로그인"),
          )
        ],
      ),
    
      )
    );
  }
}
