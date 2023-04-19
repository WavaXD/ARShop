import 'package:ARshop_App/utils/consts.dart';
import 'package:ARshop_App/widget_common/fav_lists.dart';

class fav_page extends StatefulWidget {
  const fav_page({super.key});

  @override
  State<fav_page> createState() => _fav_pageState();
}

class _fav_pageState extends State<fav_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.25,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'สินค้าที่ถูกใจ',
            style: TextStyle(color: textnavy),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.chat_bubble_outline_rounded,
              color: textnavy,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.shopping_cart_outlined,
              color: textnavy,
            ),
          )
        ],
      ),
      body: Container(
        child: fav_list(),
      ),
    );
  }
}
