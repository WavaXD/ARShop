import 'package:ARshop_App/api/API_Service.dart';
import 'package:ARshop_App/models/AddProductToCartRequest.dart';
import 'package:ARshop_App/utils/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SlidingBottomSheet extends StatefulWidget {
  final int productId;
  final String productName;
  final int variationId1;
  final int variationQuanity1;
  final String variationName1;
  final int variationPrice1;
  final int variationId2;
  final int variationQuanity2;
  final String variationName2;
  final int variationPrice2;
  final int vendorId;

  SlidingBottomSheet({
    Key? key,
    required this.productId,
    required this.productName,
    required this.variationId1,
    required this.variationQuanity1,
    required this.variationName1,
    required this.variationPrice1,
    required this.variationId2,
    required this.variationQuanity2,
    required this.variationName2,
    required this.variationPrice2,
    required this.vendorId,
  }) : super(key: key) {
    _types = [];
    _types_price = [];
    _types_variation = [];

    if (variationName1.isNotEmpty) {
      _types.add(variationName1);
      _types_price.add(variationPrice1);
      _types_variation.add(variationId1);
    }

    if (variationName2.isNotEmpty) {
      _types.add(variationName2);
      _types_price.add(variationPrice2);
      _types_variation.add(variationId2);
    }
  }

  late final List _types;
  late final List<int> _types_price;
  late final List<int> _types_variation;

  @override
  _SlidingBottomSheetState createState() => _SlidingBottomSheetState();
}

class _SlidingBottomSheetState extends State<SlidingBottomSheet> {
  late String _selectedType;
  late int _selectedTypePrice;
  late int _selectedTypeVariation;
  int _selectedQuantity = 1;
  late int price_total = _selectedTypePrice;
  final formatter = NumberFormat('#,###.00', 'en_US');

  @override
  void initState() {
    _selectedType = widget.variationName1;
    _selectedTypePrice = widget.variationPrice1;
    _selectedTypeVariation = widget.variationId1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 50),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10),
          Container(
            height: 4,
            width: 50,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 223, 221, 221),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "สี",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(width: 30),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 100,
                child: Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: widget._types.length,
                    itemBuilder: (context, index) {
                      return TextButton(
                        onPressed: () {
                          setState(() {
                            _selectedType = widget._types[index];
                            _selectedTypePrice = widget._types_price[index];
                            _selectedTypeVariation =
                                widget._types_variation[index];
                            price_total = _selectedTypePrice;
                            print(_selectedTypeVariation);
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: _selectedType == widget._types[index]
                                ? textnavy
                                : Color(0xFFF7F8FA),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            widget._types[index],
                            style: TextStyle(
                              color: _selectedType == widget._types[index]
                                  ? Colors.white
                                  : textblue,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'จำนวน',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: GestureDetector(
                  onTap: () {
                    if (_selectedQuantity > 1) {
                      setState(() {
                        _selectedQuantity--;
                        price_total = price_total - _selectedTypePrice;
                      });
                    } else {
                      setState(() {
                        _selectedQuantity = 1;
                      });
                    }
                    ;
                  },
                  child: Icon(
                    CupertinoIcons.minus,
                    size: 18,
                    color: textblue,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "$_selectedQuantity",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedQuantity += 1;
                      price_total = _selectedQuantity * _selectedTypePrice;
                    });
                  },
                  child: Icon(
                    CupertinoIcons.plus,
                    size: 18,
                    color: textblue,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ราคารวมทั้งหมด :',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '${formatter.format(price_total)} บาท',
                style: TextStyle(color: Colors.red, fontSize: 20),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () async {
              await APIService.addProductToCart(
                      productId: widget.productId,
                      variationId: _selectedTypeVariation,
                      vendorId: widget.vendorId,
                      variationQuantity: _selectedQuantity)
                  .then((value) {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Row(
                      children: <Widget>[
                        Icon(Icons.check, color: Colors.green),
                        SizedBox(width: 10),
                        Text('เพิ่มสินค้าสำเร็จ'),
                      ],
                    ),
                  ),
                );
              });
              print(
                  '${widget.productId} , ${_selectedTypeVariation} , ${widget.vendorId} , ${_selectedQuantity}');
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 120),
              decoration: BoxDecoration(
                  color: textnavy, borderRadius: BorderRadius.circular(30)),
              child: Text(
                'เพิ่มไปยังรถเข็น',
                style: TextStyle(
                    color: Colors.white, letterSpacing: 1, fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
