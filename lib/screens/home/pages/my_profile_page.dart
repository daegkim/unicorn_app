import 'package:flutter/material.dart';

class MyProfilePage extends StatelessWidget {
  final Function(bool isSignIn, String? userId) setSignIn;
  const MyProfilePage({Key? key, required this.setSignIn}) : super(key: key);

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
              onPressed: () { setSignIn(false, null); },
              child: const Text("로그아웃"),
            )
          ],
        ),
      )
    );
  }
}