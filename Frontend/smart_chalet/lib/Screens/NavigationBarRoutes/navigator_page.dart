import 'package:flutter/material.dart';
import 'Authenticated/account_page.dart';
import 'Authenticated/bar_page.dart';
import 'Authenticated/home_page.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({Key? key}) : super(key: key);

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  List pages = [
    const HomePage(),
    const BarPage(),
    const AccountPage(),
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          onTap: onTap,
          currentIndex: currentIndex,
          elevation: 0,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          selectedItemColor: const Color.fromARGB(255, 168, 182, 220),
          unselectedItemColor: Colors.grey.withOpacity(1),
          backgroundColor: const Color.fromARGB(255, 236, 241, 253),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.beach_access),
            ),
            BottomNavigationBarItem(
              label: 'Bar',
              icon: Icon(Icons.local_bar),
            ),
            BottomNavigationBarItem(
              label: 'Account',
              icon: Icon(Icons.person),
            ),
          ]),
    );
  }
}
