import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/app_layout.dart';

class card_ads extends StatelessWidget {
  const card_ads({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width,
      height: 200,
      child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [Image.asset('asset/ads_1.jpg')],
          )),
    );
  }
}
