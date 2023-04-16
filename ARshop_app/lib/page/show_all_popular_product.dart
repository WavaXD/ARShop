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
      });
    } catch (e) {
      print('Failed to fetch recommand product: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.25,
        backgroundColor: Color.fromARGB(255, 63, 81, 181),
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => search_page(),
                ));
              },
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.all(5)),
                  Icon(
                    Icons.search_rounded,
                    color: Color.fromARGB(255, 32, 57, 197),
                  ),
                  Text(
                      style: TextStyle(
                          color: Color.fromARGB(255, 108, 110, 124),
                          fontSize: 15),
                      'ค้นหาสินค้า...'),
                ],
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 15),
            icon: const badges.Badge(
              badgeContent: Text(
                '1',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
              child: Icon(Icons.notifications_active),
            ),
            onPressed: () async {
              bool result = await SharedService.isLoggedIn();
              if (result) {
                await Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      show_notification_page(), // wait add Notification page
                ));
              } else {
                await Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => login(),
                ));
              }
            },
          ),
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
              child: const Icon(Icons.shopping_cart),
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
        child: Column(
          children: [RecommedProduct(recommendProducts: recommendProducts)],
        ),
      ),
    );
  }
}
