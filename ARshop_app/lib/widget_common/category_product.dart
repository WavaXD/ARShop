import 'package:ARshop_App/utils/consts.dart';
import 'package:ARshop_App/models/GetCategoryResponse.dart';
import 'package:ARshop_App/widget_common/category_product_card.dart';

class CategoryProduct extends StatelessWidget {
  final List<GetCategoryResponse> categoryProducts;
  const CategoryProduct({Key? key, required this.categoryProducts})
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
            childAspectRatio: 0.95,
          ),
          itemCount: categoryProducts.length,
          itemBuilder: (context, index) {
            return CategoryProductCard(
                categoryProduct: categoryProducts[index]);
          }),
    );
  }
}
