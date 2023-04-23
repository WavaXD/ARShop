import "dart:async";
import "dart:math";

import "package:ARshop_App/page/login.dart";
import "package:flutter/material.dart";
import "package:ARshop_App/page/home.dart";

import "../service/shared_service.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => checkLoginStatus());
  }

  Future<void> checkLoginStatus() async {
    bool isLoggedIn = await SharedService.isLoggedIn();
    if (isLoggedIn) {
      await Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => Homepage(),
        ),
      );
    } else {
      await Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => login(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 63, 81, 181),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'asset/icon_arshop.png',
              height: 150.0,
              width: 150.0,
            ),
          ],
        ),
      ),
    );
  }
}
