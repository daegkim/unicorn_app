import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();
  
  Future<void> onPressSignOutBtn() async {
    SharedPreferences sPreferences = (await sharedPreferences);
    String? userId = sPreferences.getString("UNICORN_USER_ID");
    sPreferences.remove("UNICORN_USER_ID");
    if (!mounted) {
      if (userId != null) sPreferences.setString("UNICORN_USER_ID", userId);
      return;
    }
    await Navigator.pushNamedAndRemoveUntil(context, "/signin", (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("로그아웃"),
          OutlinedButton(
            onPressed: onPressSignOutBtn,
            child: const Text("로그아웃"),
          )
        ],
      ),
    );
  }
}