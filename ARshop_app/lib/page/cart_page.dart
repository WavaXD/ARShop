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
      body: Container(child: Text('ตะกร้าสินค้า')),
    );
  }
}
