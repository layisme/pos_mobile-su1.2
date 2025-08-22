import 'package:flutter/material.dart';
import 'package:pos/screens/home_screen.dart';
import 'package:pos/screens/menu_screen.dart';
import 'package:pos/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  late PageController _controller = PageController(initialPage: currentIndex);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: [HomeScreen(), ProfileScreen(), MenuScreen()],
      ),
      // body: [
      //   HomeScreen(),
      //   ProfileScreen(),
      //   MenuScreen(),
      // ].elementAt(currentIndex),
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          _controller.animateToPage(
            value,
            duration: Duration(milliseconds: 350),
            curve: Curves.linear,
          );
          setState(() {});
          print(currentIndex);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
            activeIcon: Icon(Icons.account_circle),
          ),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
        ],
      ),
    );
  }
}
