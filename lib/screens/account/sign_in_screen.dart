import 'package:flutter/material.dart';
import 'package:unicorn_app/screens/account/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = '/SignInScreen';
  final Function(bool isSignIn, String? userId) setSignIn;
  const SignInScreen({Key? key, required this.setSignIn}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

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
      widget.setSignIn(true, _idTextEditingController.text);
    }
  }
  
  void _clearInputs() {
    _idTextEditingController.text = "";
    _pwdTextEditingController.text = "";
  }

  void _onPressSignUpBtn() {
    _clearInputs();
    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
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
