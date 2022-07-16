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

  Future<void> _showDialog() async { 
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Alert Dialog title"),
          content: const Text("Alert Dialog body"),
          actions: <Widget>[ 
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _onPressSignUpBtn() async {
    await _showDialog();
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
