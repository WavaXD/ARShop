import 'package:ARshop_App/utils/consts.dart';
import 'package:ARshop_App/api/API_Service.dart';
import 'package:ARshop_App/models/popular_product_response.dart';
import 'package:ARshop_App/models/recommend_product_response.dart';
import 'package:ARshop_App/service/shared_service.dart';

class PopularProductCard extends StatelessWidget {
  final PopularProductResponse popularProducts;
  const PopularProductCard({Key? key, required this.popularProducts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 5, 10),
      child: Material(
        color: Colors.white,
        elevation: 1,
        shadowColor: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(5),
        child: InkWell(
          onTap: () async {
            bool result = await SharedService.isLoggedIn();
            if (result) {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => show_product(
                  productId: popularProducts.product.productId,
                ), // wait add Notification page
              ));
            } else {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => login(),
              ));
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
                        popularProducts.productPicture.pictureName,
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
                      popularProducts.product.productName,
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
                      '${popularProducts.price.toStringAsFixed(2)} บาท',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: textgrey,
                          fontSize: 14,
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
