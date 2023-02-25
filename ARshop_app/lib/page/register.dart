import 'package:flutter/material.dart';
import 'package:ARshop_App/page/login.dart';
import 'package:ARshop_App/utils/consts.dart';

bool hidePassword = true;

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
                        Navigator.of(context).pop(MaterialPageRoute(
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
        body: ListView(
          padding: EdgeInsets.only(bottom: 10.0),
          children: [
            Padding(padding: EdgeInsets.only(top: 50.0)),
            Center(
              child: Column(
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 30.0),
                      child: Container(
                        width: 300.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('asset/icon_arshop.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Column(
                        children: [
                          register_title.text.color(textnavy).size(30).make(),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(55, 0, 0, 0),
                      child: Column(
                        children: [
                          email_label.text.color(textnavy).size(16).make(),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Container(
                        width: 300.0,
                        child: TextFormField(
                          decoration: InputDecoration(
                              isDense: true,
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
                              hintText: example_email_hint,
                              hintStyle: TextStyle(color: textgreyopacity)),
                          keyboardType: TextInputType.visiblePassword,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(55, 10, 0, 0),
                      child: Column(
                        children: [
                          username_label.text.color(textnavy).size(16).make(),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Container(
                        width: 300.0,
                        child: TextFormField(
                          decoration: InputDecoration(
                              isDense: true,
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
                              hintText: username_label,
                              hintStyle: TextStyle(color: textgreyopacity)),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(55, 10, 0, 0),
                      child: Column(
                        children: [
                          password_label.text.color(textnavy).size(16).make(),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Container(
                        width: 300.0,
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              isDense: true,
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
                              hintText: hintpassword,
                              hintStyle: TextStyle(color: textgreyopacity)),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(55, 10, 0, 0),
                      child: Column(
                        children: [
                          confrim_password_label.text
                              .color(textnavy)
                              .size(16)
                              .make(),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Container(
                        width: 300.0,
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              isDense: true,
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
                              hintText: hintpassword,
                              hintStyle: TextStyle(color: textgreyopacity)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 25.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('สมัครสมาชิก'),
                          style: ButtonStyle(
                              textStyle: MaterialStateProperty.all(TextStyle(
                                fontSize: 16.0,
                              )),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              minimumSize: MaterialStateProperty.all(
                                  const Size(300, 60)),
                              backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 23, 43, 77),
                              )),
                        ),
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
                                      fontSize: 18),
                                  'มีบัญชีผู้ใช้อยู่แล้ว?'),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Column(
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          login()));
                                        },
                                        child: login_text.text
                                            .color(textblue)
                                            .make())
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
