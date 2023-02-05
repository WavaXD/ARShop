import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'login',
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  LoginPage createState() => LoginPage();
}

class LoginPage extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.25,
        leading: Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 240, 240, 240),
                  radius: 30.0,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    iconSize: 25.0,
                    color: Color.fromARGB(255, 23, 43, 77),
                    onPressed: () {
                      // Perform menu action
                    },
                  ),
                ),
              ),
            )),
        automaticallyImplyLeading: false,
        title: Text(
          'เข้าสู่ระบบ',
          style: TextStyle(
              color: Color.fromARGB(255, 23, 43, 77),
              fontFamily: 'LINESeedSansTH',
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
