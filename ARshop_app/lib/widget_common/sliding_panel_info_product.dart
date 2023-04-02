import 'package:ARshop_App/utils/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlidingBottomSheet extends StatelessWidget {
  SlidingBottomSheet({super.key});
  List Color_types = ['ขาว', 'แดง'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 50),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10),
          Container(
            height: 4,
            width: 50,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 223, 221, 221),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                'สี :',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                padding: EdgeInsets.all(13),
                decoration: BoxDecoration(
                    color: Color(0xFF031C3C),
                    borderRadius: BorderRadius.circular(20)),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                padding: EdgeInsets.all(13),
                decoration: BoxDecoration(
                    color: Color(0xFF031C3C),
                    borderRadius: BorderRadius.circular(20)),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                padding: EdgeInsets.all(13),
                decoration: BoxDecoration(
                    color: Color(0xFF031C3C),
                    borderRadius: BorderRadius.circular(20)),
              )
            ],
          ),
          Row(
            children: [
              Text(
                "ขนาด :",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(width: 30),
              for (int i = 0; i < Color_types.length; i++)
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFFF7F8FA),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(Color_types[i]),
                )
            ],
          ),
          Row(
            children: [
              Text(
                'จำนวน',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Icon(
                  CupertinoIcons.minus,
                  size: 18,
                  color: textblue,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "01",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Icon(
                  CupertinoIcons.plus,
                  size: 18,
                  color: textblue,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ราคารวมทั้งหมด :',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '189' + ' บาท',
                style: TextStyle(color: Colors.red, fontSize: 20),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 120),
              decoration: BoxDecoration(
                  color: textnavy, borderRadius: BorderRadius.circular(30)),
              child: Text(
                'เพิ่มไปยังรถเข็น',
                style: TextStyle(
                    color: Colors.white, letterSpacing: 1, fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
