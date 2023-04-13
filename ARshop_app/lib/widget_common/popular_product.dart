import 'package:ARshop_App/utils/consts.dart';
import 'package:ARshop_App/models/popular_product_response.dart';

class PopularProduct extends StatelessWidget {
  final List<PopularProductResponse> popularProducts;
  const PopularProduct({Key? key, required this.popularProducts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2.2,
        child: GridView.builder(
            scrollDirection: axisDirectionToAxis(AxisDirection.right),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            itemCount: popularProducts.length.clamp(0, 12),
            itemBuilder: (context, index) {
              return PopularProductCard(
                  popularProducts: popularProducts[index]);
            }));
  }
}
