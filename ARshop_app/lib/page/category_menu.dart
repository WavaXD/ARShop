import 'package:flutter/material.dart';
import 'package:ARshop-App/utils/app_layout.dart';

class catagory_menu extends StatelessWidget {
  const catagory_menu({Key? key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width,
      height: 250,
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'หมวดหมู่',
                    style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 23, 43, 77),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(
                        'ดูทั้งหมด',
                        style: TextStyle(
                          color: Color.fromARGB(255, 93, 92, 93),
                          fontSize: 14,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 15,
                        color: Color.fromARGB(255, 152, 149, 151),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                childAspectRatio: 1,
                children: [
                  CategoryCard(
                    icon: Icons.chair_rounded,
                    title: 'โซฟา',
                    onTap: () {
                      print('Tapped Category 1');
                    },
                  ),
                  CategoryCard(
                    icon: Icons.chair_alt_rounded,
                    title: 'เก้าอี้',
                    onTap: () {
                      print('Tapped Category 2');
                    },
                  ),
                  CategoryCard(
                    icon: Icons.table_restaurant_rounded,
                    title: 'โต๊ะ',
                    onTap: () {
                      print('Tapped Category 3');
                    },
                  ),
                  CategoryCard(
                    icon: Icons.door_sliding_rounded,
                    title: 'ตู้และชั้นวาง',
                    onTap: () {
                      print('Tapped Category 4');
                    },
                  ),
                  CategoryCard(
                    icon: Icons.bed_rounded,
                    title: 'เตียง',
                    onTap: () {
                      print('Tapped Category 5');
                    },
                  ),
                  CategoryCard(
                    icon: Icons.accessibility_new,
                    title: 'โคมไฟ',
                    onTap: () {
                      print('Tapped Category 6');
                    },
                  ),
                  CategoryCard(
                    icon: Icons.account_balance_wallet,
                    title: 'โทรทัศน์',
                    onTap: () {
                      print('Tapped Category 7');
                    },
                  ),
                  // CategoryCard(
                  //   icon: Icons.ac_unit,
                  //   title: 'Category 8',
                  //   onTap: () {
                  //     print('Tapped Category 8');
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function()? onTap;

  CategoryCard({required this.icon, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(
            icon,
            size: 35,
            color: Color.fromARGB(255, 23, 43, 77),
          ),
          Text(style: TextStyle(color: Color.fromARGB(255, 23, 43, 77)), title),
        ],
      ),
    );
  }
}
