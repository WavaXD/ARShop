import 'package:ARshop_App/utils/consts.dart';
import 'package:badges/badges.dart' as badges;
import 'package:ARshop_App/service/shared_service.dart';
import 'package:ARshop_App/page/search.dart';
import 'package:ARshop_App/models/popular_product_response.dart';
import 'package:ARshop_App/models/recommend_product_response.dart';
import 'package:ARshop_App/api/API_Service.dart';

class showAllRecommendProduct extends StatefulWidget {
  const showAllRecommendProduct({super.key});

  @override
  State<showAllRecommendProduct> createState() =>
      _showAllRecommendProductState();
}

class _showAllRecommendProductState extends State<showAllRecommendProduct> {
  List<PopularProductResponse> popularProducts = [];
  List<RecommendProductResponse> recommendProducts = [];
  bool isLoading = true;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.25,
        automaticallyImplyLeading: false,
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
        title: Text(
          'สินค้าแนะนำ',
          style: TextStyle(color: textnavy),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 10),
            icon: badges.Badge(
              badgeContent: Text(
                '1',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
              child: const Icon(
                Icons.shopping_cart,
                color: textnavy,
              ),
            ),
            onPressed: () async {
              bool result = await SharedService.isLoggedIn();
              if (result) {
                await Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      cart_bucket(), // wait add Cart page
                ));
              } else {
                await Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => login(),
                ));
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: isLoading
            ? Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 250),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: textnavy,
                      ),
                    ),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    RecommedProduct(recommendProducts: recommendProducts)
                  ],
                ),
              ),
      ),
    );
  }
}
