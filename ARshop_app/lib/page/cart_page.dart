import 'package:ARshop_App/models/GetProductsinCart.dart';
import 'package:ARshop_App/utils/consts.dart';

class cart_bucket extends StatefulWidget {
  const cart_bucket({super.key});

  @override
  State<cart_bucket> createState() => _cart_bucketState();
}

class _cart_bucketState extends State<cart_bucket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'รถเข็นของฉัน',
          style: TextStyle(color: textnavy),
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            Card(
              child: ListTile(
                leading: Text('test'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
