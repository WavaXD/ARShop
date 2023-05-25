import 'dart:async';
import 'package:ARshop_App/models/search_request_model.dart';
import 'package:ARshop_App/models/search_response_model.dart';
import 'package:ARshop_App/page/product.dart';
import 'package:flutter/material.dart';
import 'package:ARshop_App/utils/consts.dart';
import 'package:ARshop_App/api/API_Service.dart';
import 'package:material_symbols_icons/sharp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class search_page extends StatefulWidget {
  search_page({Key? key}) : super(key: key);

  @override
  State<search_page> createState() => _search_pageState();
}

class _search_pageState extends State<search_page> {
  late TextEditingController searchController;
  late String lastSearch;
  List<SearchResponse> searchResults = [];
  Timer? debounceTimer;
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    lastSearch = '';
    setState(() {
      searchResults = [];
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<SearchResponse> sortSearchResult(
      String query, List<SearchResponse> results) {
    if (query.isEmpty || results.isEmpty) {
      return results;
    }

    // หาความใกล้เคียงของตัวอักษร
    final queryLength = query.length;
    final matchedResults = results
        .where((result) => result.product.productName
            .toLowerCase()
            .contains(query.toLowerCase()))
        .toList();

    // เรียงลำดับตามความใกล้เคียงของตัวอักษร
    matchedResults.sort((a, b) {
      final aIndex =
          a.product.productName.toLowerCase().indexOf(query.toLowerCase());
      final bIndex =
          b.product.productName.toLowerCase().indexOf(query.toLowerCase());
      if (aIndex == bIndex) {
        // ถ้าตำแหน่งของตัวอักษรตรงกันให้เรียงตามอัลฟาเบ็ติคอลล์ (alphabetical order)
        return a.product.productName
            .toLowerCase()
            .compareTo(b.product.productName.toLowerCase());
      } else {
        // ถ้าตำแหน่งของตัวอักษรไม่ตรงกันให้เรียงตามตำแหน่งที่ใกล้เคียงที่สุดก่อน
        final aDistance = (aIndex - queryLength).abs();
        final bDistance = (bIndex - queryLength).abs();
        return aDistance.compareTo(bDistance);
      }
    });

    return matchedResults;
  }

  Future<void> searchProduct(String query) async {
    if (query == null || query.isEmpty) {
      return;
    }
    setState(() {
      lastSearch = query;
    });
    final model = SearchRequest(productName: query);
    try {
      final results = await APIService.getSearchItem(model);
      print('result: $results');
      setState(() {
        searchResults = results;
        print('$searchResults');
      });
    } catch (e) {
      print('Error: $e และ $query');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.25,
        backgroundColor: Color.fromARGB(255, 63, 81, 181),
        leading: Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Align(
                alignment: Alignment.center,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  iconSize: 25.0,
                  color: Color.fromARGB(255, 255, 255, 255),
                  onPressed: () {
                    Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const product_page()));
                  },
                ),
              ),
            )),
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Expanded(
                  child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: "ค้นหาสินค้า...",
                  hintStyle: TextStyle(color: textgrey, fontSize: 15),
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: textblue,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => searchController.clear(),
                    icon: Icon(
                      Icons.clear,
                      color: textblue,
                    ),
                  ),
                ),
                autofocus: false,
                keyboardType: TextInputType.text,
                controller: searchController,
                onChanged: (searchController) {
                  if (searchController.isNotEmpty) {
                    searchProduct(searchController);
                    print('$searchController');
                  } else {
                    setState(() {
                      searchResults = [];
                    });
                  }
                },
              )),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: searchResults.isNotEmpty
                ? ListView.builder(
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      final result = searchResults[index];
                      return Card(
                        child: ListTile(
                          title: Text(result.product.productName),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => show_product(
                                  productId: result.product.productId),
                            ),
                          ),
                          trailing: Icon(MaterialSymbols.navigate_next),
                        ),
                      );
                    },
                  )
                : lastSearch.isNotEmpty
                    ? const Center(
                        child: Text('ไม่พบสินค้าที่ค้นหา'),
                      )
                    : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
