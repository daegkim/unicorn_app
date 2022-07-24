import 'package:flutter/material.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unicorn_app/screens/home/home_screen.dart';
import 'package:unicorn_app/screens/account/sign_in_screen.dart';
import 'package:unicorn_app/screens/home/item_detail_screen.dart';

bool isSignedIn = false;

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? userId = sharedPreferences.getString("UNICORN_USER_ID");
  if (userId != null) {
    isSignedIn = true;
  }
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // routes에 경로 이름을 "/"로 하면 무조건 해당 경로가 생겨버린다
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: isSignedIn ? "/home" : "/signin",
      routes: {
        "/home": (context) => const HomeScreen(),
        "/signin": (context) => const SignInScreen(),
        "/itemDetail": (context) => const ItemDetailScreen(),
      },
    );
  }
}