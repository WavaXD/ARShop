import 'package:flutter/material.dart';
import 'package:ARshop_App/utils/consts.dart';

class fav_list extends StatelessWidget {
  fav_list({super.key});

  final List<Map<String, dynamic>> items = [
    {
      'name': 'Modernform Sofa COLLY',
      'price': 29900,
      'image': 'asset/image(1).png',
    },
    {
      'name': 'Modernform Sofa NEW FABRIC',
      'price': 25500,
      'image': 'asset/image(3).png',
    },
    {
      'name': 'Modernform Sofa SET 3+2+1',
      'price': 100000,
      'image': 'asset/image(4).png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 12, right: 12),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                child: ListTile(
                  leading: Text(
                    'สินค้าที่ถูกใจทั้งหมด (${items.length})',
                    style: TextStyle(fontSize: 16, color: textnavy),
                  ),
                  trailing: InkWell(
                    onTap: () {},
                    child: Text('แก้ไข'),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: InkWell(
                        onTap: () {},
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          leading: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(
                                items[index]['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text(
                                items[index]['name'],
                                style: TextStyle(
                                  color: textnavy,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'ราคา ${items[index]['price']} บาท',
                                style: TextStyle(color: textnavy, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
