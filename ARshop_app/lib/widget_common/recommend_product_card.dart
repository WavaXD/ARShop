import 'package:flutter/material.dart';
import 'package:ARshop_App/models/recommend_product_response.dart';
import 'package:ARshop_App/utils/consts.dart';

class RecommendProductCard extends StatelessWidget {
  final RecommendProductResponse recommendProduct;
  const RecommendProductCard({Key? key, required this.recommendProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 5, 10),
      child: Material(
        elevation: 1,
        color: Colors.white,
        shadowColor: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () {},
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
                        'https://arshopimage.s3.ap-southeast-1.amazonaws.com/images/sofa.png',
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
                      recommendProduct.productName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: textnavy,
                          fontSize: 15,
                          fontFamily: 'LINESeedSansTH'),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  // color: Colors.amber,
                  child: Container(
                    child: Text(
                      '${recommendProduct.productReach.toStringAsFixed(2)} บาท',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: textgrey,
                          fontSize: 18,
                          fontFamily: 'LINESeedSansTHRg'),
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
