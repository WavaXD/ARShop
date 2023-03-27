import 'package:ARshop_App/page/profile.dart';
import 'package:flutter/material.dart';

import 'package:ARshop_App/page/login.dart';
import 'package:ARshop_App/page/product.dart';
import 'package:ARshop_App/page/register.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  static final List<Widget> _widgetOptions = <Widget>[
    product_page(),
    const Text('Favorite'),
    const Text('Chat'),
    profile(),
  ];

  int currentTabIndex = 0;
  onTapmenu(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Center(child: _widgetOptions[currentTabIndex]),
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: onTapmenu,
            elevation: 10,
            type: BottomNavigationBarType.shifting,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: Color.fromARGB(255, 63, 81, 181),
            unselectedItemColor: Colors.grey,
            currentIndex: currentTabIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_sharp),
                activeIcon: Icon(Icons.home_rounded),
                label: 'หน้าแรก',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined),
                activeIcon: Icon(Icons.favorite_rounded),
                label: 'สินค้าที่ถูกใจ',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.comment_outlined),
                activeIcon: Icon(Icons.comment_rounded),
                label: 'กล่องข้อความ',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                activeIcon: Icon(Icons.account_circle_rounded),
                label: 'โปรไฟล์',
              ),
            ]));
  }
}
