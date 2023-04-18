import 'package:ARshop_App/models/recommend_product_response.dart';
import 'package:ARshop_App/utils/consts.dart';
import 'package:ARshop_App/widget_common/popular_product_all_card.dart';

import '../models/popular_product_response.dart';

class AllPopularProduct extends StatelessWidget {
  final List<PopularProductResponse> popularProducts;
  const AllPopularProduct({Key? key, required this.popularProducts})
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
          itemCount: popularProducts.length.clamp(0, 50),
          itemBuilder: (context, index) {
            return AllPopularProductCard(
              popularProducts: popularProducts[index],
            );
          }),
    );
  }
}
