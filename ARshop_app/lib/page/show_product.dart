import 'package:ARshop_App/utils/consts.dart';

class show_product extends StatefulWidget {
  const show_product({super.key});

  @override
  State<show_product> createState() => _show_productState();
}

class _show_productState extends State<show_product> {
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
          'White Lamp',
          style: TextStyle(
              color: textnavy, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: textnavy,
              ))
        ],
      ),
    );
  }
}
