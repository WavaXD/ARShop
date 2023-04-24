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
    double total = 0;
    for (var i = 0; i < inCartProducts.length; i++) {
      var inCartProduct = inCartProducts[i];
      var productDetail = productDetails[i];

      total +=
          (productDetail.variationModelContext[0].variation.variationPrice *
              inCartProduct.orderDetail.variationQuanity);
    }

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
                          leading: Text('รอชื่อร้านจาก API อย่างเดียว'),
                          trailing: TextButton(
                            onPressed: () {},
                            child: Text(
                              'แก้ไข',
                              style: TextStyle(color: textnavy),
                            ),
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
                                  if (inCartProduct
                                          .orderDetail.variationQuanity >
                                      1) {
                                    setState(() {
                                      inCartProduct
                                          .orderDetail.variationQuanity -= 1;
                                    });
                                    APIService.addProductToCart(
                                        productId:
                                            inCartProduct.orderDetail.productId,
                                        variationId: inCartProduct
                                            .orderDetail.variationId,
                                        vendorId:
                                            inCartProduct.orderDetail.vendorId,
                                        variationQuantity: inCartProduct
                                            .orderDetail.variationQuanity);
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            content: Text(
                                                'ยืนยันที่จะลบสินค้าหรือไม่?'),
                                            actions: [
                                              TextButton(
                                                child: Text('ยกเลิก'),
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                              ),
                                              TextButton(
                                                child: Text('ยืนยัน'),
                                                onPressed: () async {
                                                  await APIService
                                                      .deleteProductInCart(
                                                          productId:
                                                              inCartProduct
                                                                  .orderDetail
                                                                  .productId,
                                                          variationId:
                                                              inCartProduct
                                                                  .orderDetail
                                                                  .variationId,
                                                          vendorId:
                                                              inCartProduct
                                                                  .orderDetail
                                                                  .vendorId,
                                                          variationQuantity: 0);
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                          MaterialPageRoute(
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  cart_bucket()));
                                                },
                                              )
                                            ],
                                          );
                                        });
                                  }
                                },
                              ),
                              Text(
                                  '${inCartProduct.orderDetail.variationQuanity}'),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () async {
                                  setState(() {
                                    inCartProduct
                                        .orderDetail.variationQuanity += 1;
                                  });
                                  await APIService.deleteProductInCart(
                                      productId:
                                          inCartProduct.orderDetail.productId,
                                      variationId:
                                          inCartProduct.orderDetail.variationId,
                                      vendorId:
                                          inCartProduct.orderDetail.vendorId,
                                      variationQuantity: inCartProduct
                                          .orderDetail.variationQuanity);
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
          height: 100,
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
                                  color: textgrey,
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
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ทั้งหมด',
                      style: TextStyle(
                          color: textnavy,
                          fontSize: 18,
                          fontFamily: 'LINESeedSansTHRg'),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                'ยอดรวม : ',
                                style: TextStyle(
                                    color: textnavy,
                                    fontFamily: 'LINESeedSansTHRg'),
                              ),
                              Text(
                                '${formatter.format(total)} บาท ',
                                style: TextStyle(
                                    color: Color.fromRGBO(243, 107, 107, 100),
                                    fontSize: 22),
                              ),
                              TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: textnavy,
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'ซื้อสินค้า',
                                    style: TextStyle(color: Colors.white),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
