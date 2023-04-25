import 'package:ARshop_App/models/GetCategoryResponse.dart';
import 'package:ARshop_App/utils/consts.dart';
import 'package:ARshop_App/widget_common/category_product.dart';
import 'package:badges/badges.dart' as badges;
import 'package:ARshop_App/service/shared_service.dart';
import 'package:ARshop_App/page/search.dart';
import 'package:ARshop_App/models/popular_product_response.dart';
import 'package:ARshop_App/models/recommend_product_response.dart';
import 'package:ARshop_App/api/API_Service.dart';

class showAllCategory extends StatefulWidget {
  final int categoryId;
  const showAllCategory({Key? key, required this.categoryId}) : super(key: key);

  @override
  State<showAllCategory> createState() => _showAllCategoryState();
}

class _showAllCategoryState extends State<showAllCategory> {
  List<GetCategoryResponse> categoryProducts = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    _fetchcategoryProducts(widget.categoryId);
  }

  Future<List<GetCategoryResponse>> _fetchcategoryProducts(
      int categoryId) async {
    try {
      final getCategoryProductsData =
          await APIService.getCategory(widget.categoryId);
      if (getCategoryProductsData == null) {
        // handle case when data is null
        print("$getCategoryProductsData นี่จ้า");
        setState(() {
          isLoading = false;
        });
      } else {
        setState(() {
          categoryProducts = getCategoryProductsData;
          isLoading = false;
        });
      }
      return categoryProducts;
    } catch (e) {
      print('Failed to fetch category products: $e $categoryId');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    String _titleCate = '';
    List<String> categoryTitles = [
      'โซฟา',
      'เก้าอี้',
      'โต๊ะ',
      'ตู้และชั้นวาง',
      'เตียง',
      'โคมไฟ',
      'โทรทัศน์',
      'อื่นๆ'
    ];
    if (widget.categoryId == 1) {
      _titleCate = categoryTitles[0];
    } else if (widget.categoryId == 2) {
      _titleCate = categoryTitles[1];
    } else if (widget.categoryId == 3) {
      _titleCate = categoryTitles[2];
    } else if (widget.categoryId == 4) {
      _titleCate = categoryTitles[3];
    } else if (widget.categoryId == 5) {
      _titleCate = categoryTitles[4];
    } else if (widget.categoryId == 6) {
      _titleCate = categoryTitles[5];
    } else if (widget.categoryId == 7) {
      _titleCate = categoryTitles[6];
    } else if (widget.categoryId == 8) {
      _titleCate = categoryTitles[7];
    }
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
          _titleCate,
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
                    CategoryProduct(categoryProducts: categoryProducts)
                  ],
                ),
              ),
      ),
    );
  }
}
