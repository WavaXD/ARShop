import 'dart:async';
import 'package:ARshop_App/models/search_request_model.dart';
import 'package:ARshop_App/models/search_response_model.dart';
import 'package:ARshop_App/page/product.dart';
import 'package:flutter/material.dart';
import 'package:ARshop_App/utils/consts.dart';
import 'package:ARshop_App/api/API_Service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class search_page extends StatefulWidget {
  search_page({Key? key}) : super(key: key);
  List<String> _data = [];
  Timer? _debounce;
  String searchProuct = "";

  @override
  State<search_page> createState() => _search_pageState();
}

class _search_pageState extends State<search_page> {
  final focusNode = FocusNode();
  final TextEditingController searchController = TextEditingController();
  List<String> _data = [];
  List<String> _searchHistory = [];

  void _loadSearchHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _searchHistory = prefs.getStringList("search_history") ?? [];
  }

  void _saveSearchHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList("search_history", _searchHistory);
  }

  @override
  void initState() {
    super.initState();
    _loadSearchHistory();
  }

  Future<void> _searchProduct(String searchText) async {
    if (searchText.isEmpty) {
      setState(() {
        widget._data = _searchHistory;
      });
      return;
    }

    final model = SearchModel(productName: searchText);
    try {
      final searchResult = await APIService.getSearchItem(model);
      setState(() {
        widget._data = searchResult.map((e) => e.productName).toList();
      });
      _searchHistory.add(searchText);
      _saveSearchHistory();
    } catch (e) {
      print(e.toString());
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
              Padding(
                padding: EdgeInsets.only(left: 10, right: 5),
                child: Icon(
                  Icons.search_rounded,
                  color: Color.fromARGB(255, 32, 57, 197),
                ),
              ),
              Expanded(
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: "ค้นหาสินค้า...",
                    hintStyle: TextStyle(color: textgrey),
                    contentPadding: EdgeInsets.only(bottom: 9),
                    border: InputBorder.none,
                  ),
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  controller: searchController,
                  onChanged: (text) {
                    if (widget._debounce?.isActive ?? false) {
                      widget._debounce!.cancel();
                    }
                    widget._debounce =
                        Timer(const Duration(milliseconds: 500), () {
                      _searchProduct(text);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          _searchHistory.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'คำค้นหาล่าสุด',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ),
                )
              : SizedBox.shrink(),
          _searchHistory.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final item = _searchHistory[index];
                      return ListTile(
                        title: Text(item),
                        onTap: () {
                          searchController.text = item;
                          _searchProduct(item);
                        },
                      );
                    },
                    itemCount: _searchHistory.length,
                  ),
                )
              : SizedBox.shrink(),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                final item = widget._data[index];
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    searchController.text = item;
                    _searchProduct(item);
                    _saveSearchHistory();
                  },
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: widget._data.length,
            ),
          )
        ],
      ),
    );
  }
}
