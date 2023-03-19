import 'dart:js_util';

import 'package:ARshop_App/page/product.dart';
import 'package:flutter/material.dart';
import 'package:ARshop_App/utils/consts.dart';

class search_page extends StatefulWidget {
  const search_page({super.key});

  @override
  State<search_page> createState() => _search_pageState();
}

class _search_pageState extends State<search_page> {
  final focusNode = FocusNode();
  List<String> _data = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.25,
        backgroundColor: Color.fromARGB(255, 63, 81, 181),
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
                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const product_page()));
                    },
                  ),
                ),
              ),
            )),
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, right: 5),
                child: Icon(
                  Icons.search_rounded,
                  color: Color.fromARGB(255, 32, 57, 197),
                ),
              ),
              Expanded(
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: "ค้นหาสินค้า...",
                    hintStyle: TextStyle(color: textgrey),
                    contentPadding: EdgeInsets.only(bottom: 9),
                    border: InputBorder.none,
                  ),
                  autofocus: true,
                  keyboardType: TextInputType.text,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
