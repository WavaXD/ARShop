import 'package:ARshop_App/models/recommend_product_response.dart';
import 'package:ARshop_App/utils/consts.dart';

class RecommedProduct extends StatelessWidget {
  final List<RecommendProductResponse> recommendProducts;
  const RecommedProduct({Key? key, required this.recommendProducts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
          scrollDirection: axisDirectionToAxis(AxisDirection.down),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: 2 / 3,
          ),
          itemCount: recommendProducts.length.clamp(0, 50),
          itemBuilder: (context, index) {
            return RecommendProductCard(
              recommendProduct: recommendProducts[index],
            );
          }),
    );
  }
}
