import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/splash_page.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ARShop',
        theme: ThemeData(
            // useMaterial3: true,
            ),
        home: SplashScreen(),
        debugShowCheckedModeBanner: false);
  }
}
