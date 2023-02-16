import 'package:flutter/material.dart';

class login extends StatefulWidget {
  @override
  LoginPage createState() => LoginPage();
}

class LoginPage extends State<login> {
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
        body: ListView(
          padding: EdgeInsets.only(bottom: 100.0),
          children: [
            Padding(padding: EdgeInsets.only(top: 100.0)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 50.0),
                    child: Container(
                      width: 300.0,
                      height: 130.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('asset/icon_arshop.png'),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Container(
                      width: 300.0,
                      child: TextField(
                        style: TextStyle(
                          fontFamily: 'LINESeedSansTH',
                        ),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            prefix: Container(
                              width: 10,
                              height: 10,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1.9,
                                color: Color.fromARGB(500, 63, 81, 181),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: 'ชื่อผู้ใช้',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(244, 102, 104, 115))),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Container(
                      width: 300.0,
                      child: TextField(
                        style: TextStyle(
                          fontFamily: 'LINESeedSansTH',
                        ),
                        obscureText: true,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            suffixIcon: Icon(
                              Icons.visibility_off,
                              color: Colors.black,
                            ),
                            prefix: Container(
                              width: 10,
                              height: 10,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1.9,
                                color: Color.fromARGB(500, 63, 81, 181),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: 'รหัสผ่าน',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(244, 102, 104, 115))),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('เข้าสู่ระบบ'),
                      style: ButtonStyle(
                          textStyle: MaterialStateProperty.all(TextStyle(
                            fontFamily: 'LINESeedSansTH',
                            fontSize: 16.0,
                          )),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          minimumSize:
                              MaterialStateProperty.all(const Size(300, 60)),
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 23, 43, 77),
                          )),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                                style: TextStyle(
                                    color: Color.fromARGB(255, 23, 43, 77),
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'LINESeedSansTH',
                                    fontSize: 18),
                                'ยังไม่มีบัญชีผู้ใช้?'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                                style: TextStyle(
                                    color: Color.fromARGB(255, 63, 81, 181),
                                    fontFamily: 'LINESeedSansTH',
                                    fontSize: 16),
                                'สมัครสมาชิก'),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ],
        ));
  }
}
