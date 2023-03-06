import 'package:ARshop_App/utils/consts.dart';
import 'package:ARshop_App/widget_common/custom_label.dart';
import 'package:flutter/material.dart';
import 'package:ARshop_App/page/category_menu.dart';
import 'package:ARshop_App/page/login.dart';
import 'package:ARshop_App/page/picture_ads.dart';
import 'package:ARshop_App/page/search.dart';
import 'package:gap/gap.dart';

class product_page extends StatefulWidget {
  const product_page({super.key});

  @override
  State<product_page> createState() => _product_pageState();
}

class _product_pageState extends State<product_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.25,
        backgroundColor: Color.fromARGB(255, 63, 81, 181),
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => search_page(),
                ));
              },
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.all(5)),
                  Icon(
                    Icons.search_rounded,
                    color: Color.fromARGB(255, 32, 57, 197),
                  ),
                  Text(
                      style: TextStyle(
                          color: Color.fromARGB(255, 108, 110, 124),
                          fontSize: 15),
                      'ค้นหาสินค้า...'),
                ],
              ),
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
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                VxSwiper.builder(
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    height: 150,
                    itemCount: slidersList.length,
                    enlargeCenterPage: true,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Image.asset(
                          slidersList[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(
                              EdgeInsets.symmetric(horizontal: 0),
                            )
                            .make(),
                      );
                    }),
                Row(
                  children: [catagory_menu()],
                )
              ],
            ),
          ),
          Container(
            child: Column(children: [popular_product()]),
          )
        ],
      ),
    );
  }
}
