import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/SignUpScreen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _idTextEditingController = TextEditingController();
  final _pwdTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _showSignUpCompleteDialog(Function callback) { 
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text("회원가입 완료!"),
          actions: <Widget>[ 
            TextButton(
              child: const Text("닫기"),
              onPressed: () {
                Navigator.pop(context);
                callback();
              },
            ),
          ],
        );
      },
    );
  }

  void _onPressSignUpBtn() {
    _showSignUpCompleteDialog(() {
      Navigator.popUntil(context, (route) => route.settings.name == "/signin");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp Screen"),
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
            onPressed: _onPressSignUpBtn,
            child: const Text("가입"),
          )
        ],
      ),
    
      )
    );
  }
}
