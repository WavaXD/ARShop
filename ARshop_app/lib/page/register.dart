import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/login.dart';

class register extends StatelessWidget {
  const register({super.key});

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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => login()));
                    },
                  ),
                ),
              ),
            )),
        automaticallyImplyLeading: false,
        title: Text(
          'สมัครสมาชิก',
          style: TextStyle(
              color: Color.fromARGB(255, 23, 43, 77),
              fontFamily: 'LINESeedSansTH',
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text('test'),
          ],
        ),
      ),
    );
  }
}
