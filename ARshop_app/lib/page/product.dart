import 'dart:math';
import 'package:badges/badges.dart' as badges;
import 'package:ARshop_App/service/shared_service.dart';
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
  List<String> _slidersList = [];
  int _currentIndex = 0;

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
            padding: EdgeInsets.only(right: 15),
            icon: const badges.Badge(
              badgeContent: Text(
                '1',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
              child: Icon(Icons.notifications_active),
            ),
            onPressed: () async {
              bool result = await SharedService.isLoggedIn();
              if (result) {
                await Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      show_notification_page(), // wait add Notification page
                ));
              } else {
                await Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => login(),
                ));
              }
            },
          ),
          IconButton(
            padding: EdgeInsets.only(right: 10),
            icon: badges.Badge(
              badgeContent: Text(
                '1',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
              child: const Icon(Icons.shopping_cart),
            ),
            onPressed: () async {
              bool result = await SharedService.isLoggedIn();
              if (result) {
                await Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      cart_bucket(), // wait add Cart page
                ));
              } else {
                await Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => login(),
                ));
              }
            },
          ),
        ],
      ),
      body: Container(
        color: Color.fromRGBO(255, 255, 255, 1),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  VxSwiper.builder(
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    height: 140,
                    itemCount: slidersList.length,
                    enlargeCenterPage: true,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Image.asset(
                          slidersList[index],
                          fit: BoxFit.cover,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(
                              EdgeInsets.symmetric(horizontal: 0),
                            )
                            .make(),
                      );
                    },
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Positioned(
                        child: DotsIndicator(
                      dotsCount: slidersList.length,
                      position: _currentIndex.toDouble(),
                      decorator: DotsDecorator(
                        activeColor: textnavy,
                        activeSize: const Size(5.0, 5.0),
                        size: const Size(5.0, 5.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    )),
                  ),
                  Row(
                    children: [catagory_menu()],
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(children: [popular_product()]),
            )
          ],
        ),
      ),
    );
  }
}
