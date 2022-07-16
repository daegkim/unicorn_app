import 'package:flutter/material.dart';
import 'package:unicorn_app/screens/home/pages/my_profile_page.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/HomeScreen';
  final Function(bool isSignIn, String? userId) setSignIn;
  const HomeScreen({Key? key, required this.setSignIn}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final List<Widget> _bodyWidgets = [
    const Text('Search'),
    const Text('Home'),
    MyProfilePage(setSignIn: widget.setSignIn),
  ];

  int _currentBottomNavBarIndex = 1;
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'My',
          ),
        ],
        currentIndex: _currentBottomNavBarIndex,
        onTap: (int selectedIndex) {
          setState(() => _currentBottomNavBarIndex = selectedIndex);
        },
      ),
      body: _bodyWidgets[_currentBottomNavBarIndex]
    );
  }
}
