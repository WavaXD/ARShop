import 'package:ARshop_App/utils/consts.dart';
import 'package:ARshop_App/api/API_Service.dart';
import 'package:ARshop_App/models/popular_product_response.dart';
import 'package:ARshop_App/models/recommend_product_response.dart';

class PopularProductCard extends StatelessWidget {
  final PopularProductResponse popularProducts;
  const PopularProductCard({Key? key, required this.popularProducts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 5, 10),
      child: Material(
        elevation: 0,
        shadowColor: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.only(right: 10),
          width: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    'asset/product.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                alignment: Alignment.centerLeft,
                // color: Colors.amber,
                child: Container(
                  child: Text(
                    popularProducts.productName,
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
                    popularProducts.productName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: textgrey,
                        fontSize: 20,
                        fontFamily: 'LINESeedSansTHRg'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
