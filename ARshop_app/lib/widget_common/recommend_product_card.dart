import 'package:ARshop_App/service/shared_service.dart';
import 'package:ARshop_App/widget_common/custom_label.dart';
import 'package:flutter/material.dart';
import 'package:ARshop_App/models/recommend_product_response.dart';
import 'package:ARshop_App/utils/consts.dart';
import 'package:intl/intl.dart';

class RecommendProductCard extends StatelessWidget {
  final RecommendProductResponse recommendProduct;

  const RecommendProductCard({Key? key, required this.recommendProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,##0.00');
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 5, 10),
      child: Material(
        elevation: 1,
        color: Colors.white,
        shadowColor: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () async {
            bool result = await SharedService.isLoggedIn();
            if (result) {
              await Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (BuildContext context) => show_product(
                      productId: recommendProduct.product.productId),
                ),
                (route) => false,
              );
            }
          },
          child: Container(
            padding: EdgeInsets.all(5),
            width: 100,
            child: Column(
              children: [
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        recommendProduct.productPicture.pictureName,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerLeft,
                  // color: Colors.amber,
                  child: Container(
                    child: Text(
                      recommendProduct.product.productName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: textnavy,
                          fontSize: 16,
                          fontFamily: 'LINESeedSansTH'),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  // color: Colors.amber,
                  child: Container(
                    child: Text(
                      '${formatter.format(recommendProduct.price)} บาท',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: textblue,
                          fontSize: 14,
                          fontFamily: 'LINESeedSansTH'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
