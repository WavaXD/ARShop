import 'package:ARshop_App/api/API_Service.dart';
import 'package:ARshop_App/models/GetProductsinCart.dart';
import 'package:ARshop_App/utils/consts.dart';
import 'package:material_symbols_icons/sharp.dart';
import 'package:material_symbols_icons/sharp_suffix.dart';

import 'package:intl/intl.dart';
import '../models/product_request.dart';
import '../models/product_response.dart';

class cart_bucket extends StatefulWidget {
  const cart_bucket({Key? key}) : super(key: key);

  @override
  State<cart_bucket> createState() => _cart_bucketState();
}

class _cart_bucketState extends State<cart_bucket> {
  late List<GetProductInCartResponse> inCartProducts = [];
  late List<ProductDetailResponse> productDetails;
  var formatter = NumberFormat('#,##0.00');
  @override
  void initState() {
    super.initState();
    _loadProductDetails();
  }

  Future<void> _loadProductDetails() async {
    try {
      // Load products in cart
      inCartProducts = await APIService.getProductInCart();
      if (inCartProducts != null) {
        // Load product details
        productDetails = await getProductDetails(inCartProducts);
        setState(() {});
      }
    } catch (e) {
      print('Failed to load cart products: $e $inCartProducts');
    }
  }

  Future<List<ProductDetailResponse>> getProductDetails(
      List<GetProductInCartResponse> inCartProducts) async {
    try {
      final productDetails = await Future.wait(
        inCartProducts.map(
          (product) async {
            final request =
                ProductDetailRequest(productId: product.orderDetail.productId);
            return APIService.getProductDetails(request);
          },
        ),
      );
      return productDetails;
    } catch (e) {
      print('Failed to load product details: $e');
      return [];
    }
  }

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
      body: FutureBuilder<List<ProductDetailResponse>>(
          future: getProductDetails(inCartProducts),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('มีข้อผิดพลาดเกิดขึ้น'));
            } else if (!snapshot.hasData) {
              return Center(child: Text('ไม่มีสินค้าในตะกร้า'));
            } else {
              List<ProductDetailResponse> productDetails = snapshot.data!;
              return ListView.builder(
                itemCount: inCartProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  final inCartProduct = inCartProducts[index];
                  final productDetail = productDetails[index];
                  return Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Text('test'),
                          trailing: TextButton(
                            onPressed: () {},
                            child: Text('แก้ไข'),
                          ),
                        ),
                        ListTile(
                          // leading: Image.asset(
                          //     productDetail.productPicture[0].pictureName),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  '${productDetail.variationModelContext[0].variation.variationName}'),
                              Text(
                                '${formatter.format(productDetail.variationModelContext[0].variation.variationPrice * inCartProduct.orderDetail.variationQuanity)} บาท',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    if (inCartProduct
                                            .orderDetail.variationQuanity >
                                        1) {
                                      inCartProduct
                                          .orderDetail.variationQuanity -= 1;
                                    }
                                  });
                                },
                              ),
                              Text(
                                  '${inCartProduct.orderDetail.variationQuanity}'),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    inCartProduct
                                        .orderDetail.variationQuanity += 1;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          }),
      bottomNavigationBar: Container(
          padding: EdgeInsets.only(left: 25, top: 0, right: 10, bottom: 0),
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    children: [
                      Icon(
                        MaterialSymbolsSharp.confirmation_number,
                        fill: 1,
                        color: textnavy,
                        size: 25,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'ส่วนลด',
                        style: TextStyle(color: textnavy, fontSize: 16),
                      )
                    ],
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                'เลือกส่วนลด',
                                style: TextStyle(
                                  color: textnavy,
                                  fontFamily: 'LINESeedSansTHRg',
                                ),
                              ),
                              Icon(
                                MaterialSymbols.navigate_next,
                                color: textnavy,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
