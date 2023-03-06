import 'package:ARshop_App/utils/consts.dart';

class popular_product extends StatelessWidget {
  const popular_product({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    double _initialRating = 4.5;
    var products;
    return SizedBox(
      width: size.width,
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                  onPressed: () {},
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: List.generate(
                  2, // generate 2 rows
                  (index) => Row(
                    children: List.generate(
                      6, // generate 6 columns
                      (index) => TextButton(
                        onPressed: () {},
                        child: SizedBox(
                          height: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                img2,
                                height: 130,
                                width: 130,
                                fit: BoxFit.cover,
                              ),
                              10.heightBox,
                              "White Lamp".text.color(textnavy).make(),
                              2.heightBox,
                              "189 บาท".text.color(textgrey).make(),
                            ],
                          )
                              .box
                              .margin(EdgeInsets.symmetric(horizontal: 4))
                              .make(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
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
                          onPressed: () {},
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
            Container(
              child: Column(
                children: List.generate(
                  6, // generate 2 rows
                  (index) => Row(
                    children: List.generate(
                      2, // generate 6 columns
                      (index) => TextButton(
                        onPressed: () {},
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                img2,
                                height: 160,
                                width: 160,
                                fit: BoxFit.cover,
                              ),
                              10.heightBox,
                              "White Lamp".text.color(textnavy).make(),
                              2.heightBox,
                              "189 บาท".text.color(textgrey).make(),
                              1.heightBox,
                              RatingBar.builder(
                                initialRating:
                                    _initialRating, // use product rating from data
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 15.0,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ],
                          )
                              .box
                              .margin(EdgeInsets.symmetric(horizontal: 4))
                              .make(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
