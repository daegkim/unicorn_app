import 'package:flutter/material.dart';

class MyProfilePage extends StatelessWidget {
  final Function(bool isLogin, String? userId) setLogin;
  const MyProfilePage({Key? key, required this.setLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (
      SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("로그아웃"),
            OutlinedButton(
              onPressed: () { setLogin(false, null); },
              child: const Text("로그아웃"),
            )
          ],
        ),
      )
    );
  }
}