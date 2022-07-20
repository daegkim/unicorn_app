import 'package:flutter/material.dart';
import 'package:unicorn_app/screens/home/pages/home_page.dart';
import 'package:unicorn_app/screens/home/pages/my_profile_page.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/HomeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const initialPage = 1;
  int _currentBottomNavBarIndex = initialPage;
  final List<Widget> _bodyWidgets = [
    const Text('Search'),
    const HomePage(),
    const MyProfilePage(),
  ];
  final _pageController = PageController(initialPage: initialPage);
  
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
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
          setState(() {
            _currentBottomNavBarIndex = selectedIndex;
            _pageController.jumpToPage(selectedIndex);
          });
        },
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _bodyWidgets,
      )
    );
  }
}
