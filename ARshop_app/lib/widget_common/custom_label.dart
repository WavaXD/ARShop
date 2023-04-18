import 'package:ARshop_App/models/popular_product_response.dart';
import 'package:ARshop_App/models/recommend_product_response.dart';
import 'package:ARshop_App/page/show_all_recommend_product.dart';
import 'package:ARshop_App/utils/consts.dart';
import 'package:ARshop_App/api/API_Service.dart';

import '../page/show_all_popular_product.dart';

class popular_product extends StatefulWidget {
  const popular_product({Key? key}) : super(key: key);

  @override
  _popular_productState createState() => _popular_productState();
}

class _popular_productState extends State<popular_product> {
  bool isLoading = true;
  List<PopularProductResponse> popularProducts = [];
  List<RecommendProductResponse> recommendProducts = [];
  @override
  void initState() {
    super.initState();
    _fetchPopularProducts();
    _fetchRecommendProducts();
  }

  Future<void> _fetchPopularProducts() async {
    try {
      final popularProductsData = await APIService.getPopularProduct(limit: 12);
      setState(() {
        popularProducts = popularProductsData;
        isLoading = false;
      });
    } catch (e) {
      print('Failed to fetch popular products: $e');
    }
  }

  Future<void> _fetchRecommendProducts() async {
    try {
      final recommendProductsData =
          await APIService.getRecommendProduct(limit: 12);
      setState(() {
        recommendProducts = recommendProductsData;
        isLoading = false;
      });
    } catch (e) {
      print('Failed to fetch recommand product: $e');
    }
  }

  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    double _initialRating = 4.5;
    var products;
    return SizedBox(
      width: size.width,
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    product_popular_label,
                    style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 23, 43, 77),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            showAllPopularProduct()));
                  },
                  child: Row(
                    children: [
                      Text(
                        'ดูทั้งหมด',
                        style: TextStyle(
                          color: Color.fromARGB(255, 93, 92, 93),
                          fontSize: 16,
                        ),
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
            if (isLoading)
              Center(child: CircularProgressIndicator(color: textnavy))
            else
              SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      PopularProduct(popularProducts: popularProducts)
                    ],
                  )),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            product_recommend_label,
                            style: TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 23, 43, 77),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    showAllRecommendProduct()));
                          },
                          child: Row(
                            children: [
                              Text(
                                'ดูทั้งหมด',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 93, 92, 93),
                                  fontSize: 16,
                                ),
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
                  ],
                ),
              ),
            ),
            if (isLoading)
              Center(child: CircularProgressIndicator(color: textnavy))
            else
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    RecommedProduct(recommendProducts: recommendProducts)
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
