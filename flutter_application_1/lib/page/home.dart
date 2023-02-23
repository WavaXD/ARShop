import 'package:flutter/material.dart';

import 'package:flutter_application_1/page/login.dart';
import 'package:flutter_application_1/page/register.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentTabIndex = 0;
  onTapmenu(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 63, 81, 181),
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 5),
                    prefixIcon: const Icon(Icons.search,
                        color: Color.fromARGB(255, 63, 81, 181)),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        /* Clear the search field */
                      },
                    ),
                    hintText: 'ค้นหาสินค้า...',
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 63, 81, 181),
                      fontFamily: 'LINESeedSansTH',
                      fontSize: 15,
                    ),
                    border: InputBorder.none),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_active),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => login(),
                ));
              },
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => login(),
                ));
              },
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: onTapmenu,
            elevation: 10,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: Color.fromARGB(255, 63, 81, 181),
            unselectedItemColor: Colors.grey,
            currentIndex: currentTabIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'หน้าแรก',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined),
                label: 'สินค้าที่ถูกใจ',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.comment_outlined),
                label: 'กล่องข้อความ',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: 'โปรไฟล์',
              ),
            ]));
  }
}
