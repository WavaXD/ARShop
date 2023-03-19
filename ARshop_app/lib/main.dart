import 'package:ARshop_App/page/product.dart';
import 'package:ARshop_App/page/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ARshop_App/page/login.dart';
import 'package:ARshop_App/page/splash_page.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ARshop_App/page/register.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ARShop',
        theme: ThemeData(
          fontFamily: 'LINESeedSansTH',
        ),
        home: SplashScreen(),
        debugShowCheckedModeBanner: false);
  }
}