import 'package:ARshop_App/api/API_Service.dart';
import 'package:ARshop_App/models/product_request.dart';
import 'package:ARshop_App/models/product_response.dart';
import 'package:ARshop_App/page/ar_preview.dart';
import 'package:ARshop_App/page/show_reviews.dart';
import 'package:ARshop_App/utils/consts.dart';
import 'package:ARshop_App/widget_common/sliding_panel_info_product.dart';
import 'package:material_symbols_icons/outlined_suffix.dart';
import 'package:material_symbols_icons/rounded.dart';
import 'package:ARshop_App/widget_common/sliding_panel_info_product.dart';
import 'package:intl/intl.dart';

class show_product extends StatefulWidget {
  final int productId;
  const show_product({Key? key, required this.productId}) : super(key: key);

  @override
  State<show_product> createState() => _show_productState();
}

class _show_productState extends State<show_product> {
  //เรียกใช้ API Service
  // late Future<PurpleProductDetailResponse> modelproducts;
  // late Future<FluffyProductDetailResponse> variationproducts;
  late Future<ProductDetailResponse> products;

  final controller = GroupButtonController();
  final _panelController = PanelController();
  double price = 1500;
  var formatter = NumberFormat('#,##0.00');
  int _currentIndex = 0;
  double _initialRating = 4.5;
  int color_type = 0;
  @override
  void initState() {
    // modelproducts = APIService.getModelProductDetails(widget.productId);
    // variationproducts = APIService.getVariationProductDetails(widget.productId);
    products = APIService.getProductDetails(
        ProductDetailRequest(productId: widget.productId));

    super.initState();
  }

  // Future<void> getProductDetail() async {
  //   final productDetailRequest =
  //       ProductDetailRequest(productId: widget.productId);
  //   final productDetailResponse =
  //       TentacledProductDetailResponse(productId: productDetailRequest as int);
  //   final response = await APIService.getProductDetails(widget.productId);
  //   return response;
  // }

  @override
  Widget build(BuildContext context) {
    String formatted = formatter.format(price);
    final size = AppLayout.getSize(context);
    List<String> model_to_show = [];
    if (widget.productId == 6) {
      model_to_show.addAll([
        'asset/3Dmodels/sofa/sofa2/sofa2_ver1.glb',
        'asset/3Dmodels/sofa/sofa2/sofa2_ver2.glb'
      ]);
    } else if (widget.productId == 43) {
      model_to_show.addAll([
        'asset/3Dmodels/sofa/sofa1/sofa1_ver1_update.glb',
        'asset/3Dmodels/sofa/sofa1/sofa1_ver2.glb',
      ]);
    } else if (widget.productId == 44) {
      model_to_show.addAll([
        'asset/3Dmodels/sofa/sofa3/sofa3_ver1.glb',
      ]);
    } else if (widget.productId == 1) {
      model_to_show.addAll([
        'asset/3Dmodels/table/table1/table1_ver1.glb',
        'asset/3Dmodels/table/table1/table1_ver2.glb',
      ]);
    } else if (widget.productId == 2) {
      model_to_show.addAll([
        'asset/3Dmodels/chair/chair1/chair1_ver1.glb',
        'asset/3Dmodels/chair/chair1/chair1_ver2.glb',
      ]);
    } else if (widget.productId == 30) {
      model_to_show.addAll([
        'asset/3Dmodels/chair/chair2/chair2_ver1.glb',
        'asset/3Dmodels/chair/chair2/chair2_ver2.glb',
        // 'asset/3Dmodels/chair/chair3/chair3_ver1.glb',
        // 'asset/3Dmodels/chair/chair3/chair3_ver2.glb',
        // 'asset/3Dmodels/table/table1/table1_ver1.glb',
        // 'asset/3Dmodels/table/table1/table1_ver2.glb',
        // 'asset/3Dmodels/table/table2/table2_ver1.glb',
        // 'asset/3Dmodels/table/table2/table2_ver2.glb',
        // 'asset/3Dmodels/table/table3/table3_ver1.glb',
        // 'asset/3Dmodels/table/table3/table3_ver2.glb',
        // 'asset/3Dmodels/chair/chair3/Chair.glb'
      ]);
    } else if (widget.productId == 40) {
      model_to_show.addAll([
        'asset/3Dmodels/chair/chair3/chair3_ver1.glb',
        'asset/3Dmodels/chair/chair3/chair3_ver2.glb',
        // 'asset/3Dmodels/table/table1/table1_ver1.glb',
        // 'asset/3Dmodels/table/table1/table1_ver2.glb',
        // 'asset/3Dmodels/table/table2/table2_ver1.glb',
        // 'asset/3Dmodels/table/table2/table2_ver2.glb',
        // 'asset/3Dmodels/table/table3/table3_ver1.glb',
        // 'asset/3Dmodels/table/table3/table3_ver2.glb',
        // 'asset/3Dmodels/chair/chair3/Chair.glb'
      ]);
    } else if (widget.productId == 37) {
      model_to_show.addAll([
        'asset/3Dmodels/table/table1/table1_ver1.glb',
        'asset/3Dmodels/table/table1/table1_ver2.glb',
      ]);
    } else if (widget.productId == 37) {
      model_to_show.addAll([
        'asset/3Dmodels/table/table2/table2_ver1.glb',
        'asset/3Dmodels/table/table2/table2_ver2.glb',
        // 'asset/3Dmodels/table/table3/table3_ver1.glb',
        // 'asset/3Dmodels/table/table3/table3_ver2.glb',
        // 'asset/3Dmodels/chair/chair3/Chair.glb'
      ]);
    } else {
      model_to_show.addAll(['asset/3Dmodels/chair/chair3/Chair.glb']);
    }
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
        title: FutureBuilder<ProductDetailResponse>(
          future: products,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final product_name = snapshot.data!.product.productName;
              return Text(
                product_name,
                style: TextStyle(
                    color: textnavy, fontWeight: FontWeight.bold, fontSize: 18),
              );
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }
            return CircularProgressIndicator(
              color: textnavy,
            );
          },
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
            // Container(
            //   color: Colors.white,
            //   child: GroupButton(
            //     buttons: buttons,
            //     options: GroupButtonOptions(
            //         selectedBorderColor: Colors.transparent,
            //         selectedColor: textnavy,
            //         borderRadius: BorderRadius.all(Radius.circular(10)),
            //         unselectedBorderColor: textnavy,
            //         unselectedColor: Colors.white),
            //   ),
            // ),
            Container(
              // padding: EdgeInsets.all(10),
              width: 500,
              height: 300,
              child: SizedBox(
                child: Container(
                  child: VxSwiper.builder(
                    itemCount: model_to_show.length,
                    enlargeCenterPage: false,
                    itemBuilder: (context, index) {
                      return ModelViewer(
                        loading: Loading.lazy,
                        backgroundColor: Colors.white,
                        src: model_to_show[index],
                        ar: true,
                        arScale: ArScale.fixed,
                        arPlacement: ArPlacement.floor,
                        autoRotate: false,
                        cameraControls: true,
                        disableZoom: true,
                        reveal: Reveal.auto,
                      );
                    },
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  // child: ModelViewer(
                  //   backgroundColor: Colors.white,
                  //   src: model_sofa[0],
                  //   ar: true,
                  //   arScale: ArScale.fixed,
                  //   arPlacement: ArPlacement.floor,
                  //   autoRotate: false,
                  //   cameraControls: true,
                  //   disableZoom: true,
                  //   reveal: Reveal.auto,
                  // ),
                ),
              ),
            ),
            Positioned(
                child: DotsIndicator(
              dotsCount: model_sofa.length,
              position: _currentIndex.toDouble(),
              decorator: DotsDecorator(
                activeColor: textnavy,
                activeSize: const Size(5.0, 5.0),
                size: const Size(5.0, 5.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            )),
            Container(
              child: FutureBuilder<ProductDetailResponse>(
                future: products,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final product_name = snapshot.data!.product.productName;
                    return ListTile(
                      leading: Container(
                        width: 300,
                        child: Text(
                          product_name,
                          style: TextStyle(fontSize: 22, color: textnavy),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
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
                    );
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  }
                  return CircularProgressIndicator(
                    color: textnavy,
                  );
                },
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
            FutureBuilder(
                future: products,
                builder: (context, snapshot) {
                  final detail_product =
                      snapshot?.data?.product.productDetail ??
                          'ไม่มีรายละเอียดสินค้า';
                  if (snapshot.hasData) {
                    return Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        children: [
                          Text(
                            detail_product,
                            softWrap: true,
                            style: TextStyle(
                                color: textgrey,
                                fontSize: 16,
                                fontFamily: 'LINESeedSansTHRg'),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  }
                  return CircularProgressIndicator(
                    color: textnavy,
                  );
                }),

            FutureBuilder(
                future: products,
                builder: (context, snapshot) {
                  final detail_price = snapshot
                      .data?.variationModelContext[0].variation.variationPrice;
                  if (snapshot.hasData) {
                    return Container(
                      child: ListTile(
                        leading: Text(
                          'ราคา ${formatter.format(detail_price)} บาท',
                          style: TextStyle(color: textnavy, fontSize: 22),
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    print('Error : ${snapshot.error}');
                  }
                  return CircularProgressIndicator(
                    color: textnavy,
                  );
                }),
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
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => show_reviews()));
                  },
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                                fontFamily: 'LINESeedSansTH',
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
                  onTap: () async {
                    try {
                      final productDetailResponse =
                          await APIService.getProductDetails(
                              ProductDetailRequest(
                                  productId: widget.productId));
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          int? variationId1, variationQuanity1, variationPrice1;
                          String? variationName1;
                          int? variationId2, variationQuanity2, variationPrice2;
                          String? variationName2;

                          if (productDetailResponse
                                  .variationModelContext.length >
                              0) {
                            variationId1 = productDetailResponse
                                .variationModelContext[0].variation.variationId;
                            variationQuanity1 = productDetailResponse
                                .variationModelContext[0]
                                .variation
                                .variationQuanity;
                            variationName1 = productDetailResponse
                                .variationModelContext[0]
                                .variation
                                .variationName;
                            variationPrice1 = productDetailResponse
                                .variationModelContext[0]
                                .variation
                                .variationPrice;
                          }

                          if (productDetailResponse
                                  .variationModelContext.length >
                              1) {
                            variationId2 = productDetailResponse
                                .variationModelContext[1].variation.variationId;
                            variationQuanity2 = productDetailResponse
                                .variationModelContext[1]
                                .variation
                                .variationQuanity;
                            variationName2 = productDetailResponse
                                .variationModelContext[1]
                                .variation
                                .variationName;
                            variationPrice2 = productDetailResponse
                                .variationModelContext[1]
                                .variation
                                .variationPrice;
                          }

                          return SlidingBottomSheet(
                            productId: productDetailResponse.product.productId,
                            productName:
                                productDetailResponse.product.productName,
                            variationId1: variationId1 ?? 0,
                            variationQuanity1: variationQuanity1 ?? 0,
                            variationName1: variationName1 ?? '',
                            variationPrice1: variationPrice1 ?? 0,
                            variationId2: variationId2 ?? 0,
                            variationQuanity2: variationQuanity2 ?? 0,
                            variationName2: variationName2 ?? '',
                            variationPrice2: variationPrice2 ?? 0,
                            vendorId: productDetailResponse.product.vendorId,
                          );
                        },
                      );
                    } catch (e) {
                      return print("Error: $e");
                    }
                  },
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
