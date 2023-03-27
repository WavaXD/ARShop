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
                child: ModelViewer(
                  backgroundColor: Colors.white,
                  src: 'asset/3Dmodels/sofa1_ver1_update-5.glb',
                  ar: true,
                  arScale: ArScale.fixed,
                  arPlacement: ArPlacement.floor,
                  autoRotate: false,
                  cameraControls: true,
                  disableZoom: true,
                  reveal: Reveal.auto,
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
                    fill: 1,
                    color: Colors.amber[300],
                  ),
                  Text(
                    '4.5',
                    style: TextStyle(color: textnavy),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Text(
                    '(20 รีวิว)',
                    style: TextStyle(
                      color: textgrey,
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
                trailing: Wrap(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => ShowAR()));
                      },
                      child: Icon(MaterialSymbols.view_in_ar),
                    )
                  ],
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
            )
          ],
        ),
      ),
    );
  }
}
