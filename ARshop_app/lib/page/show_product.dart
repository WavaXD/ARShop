import 'package:ARshop_App/page/ar_preview.dart';
import 'package:ARshop_App/utils/consts.dart';
import 'package:material_symbols_icons/outlined_suffix.dart';
import 'package:material_symbols_icons/rounded.dart';

class show_product extends StatefulWidget {
  const show_product({super.key});

  @override
  State<show_product> createState() => _show_productState();
}

class _show_productState extends State<show_product> {
  final controller = GroupButtonController();
  double _initialRating = 4.5;
  int color_type = 0;
  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 25.0,
              ),
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
                        builder: (BuildContext context) => Homepage(),
                      ));
                    },
                  ),
                ),
              ),
            )),
        automaticallyImplyLeading: false,
        title: Text(
          product_name,
          style: TextStyle(
              color: textnavy, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: [
          IconButton(
              padding: EdgeInsets.only(right: 20),
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: textnavy,
              ))
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: GroupButton(
                buttons: buttons,
                options: GroupButtonOptions(
                    selectedBorderColor: Colors.transparent,
                    selectedColor: textnavy,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    unselectedBorderColor: textnavy,
                    unselectedColor: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: 500,
              height: 400,
              child: SizedBox(
                child: Container(
                  child: VxSwiper.builder(
                    itemCount: model_sofa.length,
                    enlargeCenterPage: true,
                    itemBuilder: (context, index) {
                      return ModelViewer(
                        backgroundColor: Colors.white,
                        src: model_sofa[index],
                        ar: true,
                        arScale: ArScale.fixed,
                        arPlacement: ArPlacement.floor,
                        autoRotate: false,
                        cameraControls: true,
                        disableZoom: true,
                        reveal: Reveal.auto,
                      );
                    },
                  ),
                ),
              ),
            ),
            Container(
              child: ListTile(
                leading: Text(
                  product_name,
                  style: TextStyle(fontSize: 30, color: textnavy),
                ),
                trailing: Wrap(
                  spacing: 15,
                  children: [
                    Icon(
                      MaterialSymbols.share,
                      weight: 700,
                      color: textnavy,
                    ),
                    Icon(
                      MaterialSymbols.heart_plus,
                      weight: 700,
                      color: textnavy,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 15)),
                  Icon(
                    MaterialSymbols.star,
                    weight: 400,
                    size: 30,
                    fill: 1,
                    color: Colors.amber[300],
                  ),
                  Text(
                    '4.5',
                    style: TextStyle(
                      color: textnavy,
                      fontSize: 18,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Text(
                    '(20 รีวิว)',
                    style: TextStyle(
                      color: textgrey,
                      fontFamily: 'LINESeedSansTHRg',
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: ListTile(
                leading: Text(
                  '189 บาท',
                  style: TextStyle(color: textnavy, fontSize: 22),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15),
              child: Column(
                children: [
                  Text(
                    'รายละเอียดสินค้า',
                    style: TextStyle(color: textnavy, fontSize: 18),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  Text(
                    'Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. ',
                    softWrap: true,
                    style: TextStyle(
                        color: textgrey,
                        fontSize: 16,
                        fontFamily: 'LINESeedSansTHRg'),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Card(
                    elevation: 0,
                    color: Color.fromRGBO(247, 247, 247, 100),
                    child: Container(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Column(
                        children: [
                          ListTile(
                            titleAlignment: ListTileTitleAlignment.threeLine,
                            leading: InkWell(
                              onTap: () {},
                              child: CircleAvatar(
                                radius: 20,
                                backgroundImage: NetworkImage(
                                    'https://image.makewebeasy.net/makeweb/m_750x0/e2kfIZfW0/Carpet/134233.jpg?v=202012190947'),
                              ),
                            ),
                            title: InkWell(
                              onTap: () {},
                              child: Text(
                                'BANN FURNITURE (บ้านเฟอร์นิเจอร์)',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 12, color: textnavy),
                              ),
                            ),
                            trailing: Container(
                              width: 80,
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  backgroundColor: textnavy,
                                ),
                                child: Text(
                                  'ดูร้านค้า',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(
                  left: 15,
                )),
                Expanded(
                  child: Text(
                    'รีวิว',
                    style: TextStyle(
                      fontSize: 22,
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
                            fontSize: 16,
                            fontFamily: 'LINESeedSansTHRg'),
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
            Container(
              height: 170,
              child: Card(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      ListTile(
                        titleAlignment: ListTileTitleAlignment.threeLine,
                        leading: CircleAvatar(
                            radius: 20, backgroundImage: NetworkImage('')),
                        title: Text(
                          'Palm Siriphun',
                          style: TextStyle(
                              fontFamily: 'LINESeedSansTHRg',
                              fontSize: 18,
                              color: textnavy),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          children: [
                            Text('คะแนน'),
                            Padding(padding: EdgeInsets.only(left: 5)),
                            RatingBar.builder(
                              initialRating:
                                  _initialRating, // use product rating from data
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 15.0,
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        titleAlignment: ListTileTitleAlignment.threeLine,
                        title: Text(
                          comment,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyle(
                              fontFamily: 'LINESeedSansTHRg',
                              fontSize: 16,
                              color: textgrey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 170,
              child: Card(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      ListTile(
                        titleAlignment: ListTileTitleAlignment.threeLine,
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(''),
                        ),
                        title: Text(
                          'Palm Siriphun',
                          style: TextStyle(
                              fontFamily: 'LINESeedSansTHRg',
                              fontSize: 18,
                              color: textnavy),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          children: [
                            Text('คะแนน'),
                            Padding(padding: EdgeInsets.only(left: 5)),
                            RatingBar.builder(
                              initialRating:
                                  _initialRating, // use product rating from data
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 15.0,
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        titleAlignment: ListTileTitleAlignment.threeLine,
                        title: Text(
                          comment,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyle(
                              fontFamily: 'LINESeedSansTHRg',
                              fontSize: 16,
                              color: textgrey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.only(top: 10),
          color: Colors.white,
          height: 70,
          child: ListTile(
            title: Wrap(
              spacing: 50,
              alignment: WrapAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Icon(
                        MaterialSymbols.chat,
                        color: textnavy,
                        weight: 800,
                      ),
                      Text(
                        'แชท',
                        style: TextStyle(
                            color: textnavy, fontFamily: 'LINESeedSansTHRg'),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Icon(
                        MaterialSymbols.shopping_cart,
                        color: textnavy,
                        weight: 800,
                      ),
                      Text(
                        'เพิ่มลงรถเข็น',
                        style: TextStyle(
                            color: textnavy, fontFamily: 'LINESeedSansTHRg'),
                      )
                    ],
                  ),
                ),
              ],
            ),
            trailing: Column(
              children: [
                Container(
                  width: 180,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: textnavy,
                    ),
                    onPressed: () {},
                    child: Text(
                      'ซื้อเลย',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
