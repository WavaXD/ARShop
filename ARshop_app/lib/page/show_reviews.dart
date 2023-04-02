import 'package:ARshop_App/utils/consts.dart';

class show_reviews extends StatefulWidget {
  const show_reviews({super.key});

  @override
  State<show_reviews> createState() => _show_reviewsState();
}

class _show_reviewsState extends State<show_reviews> {
  double _initialRating = 4.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
                        builder: (BuildContext context) => show_product(),
                      ));
                    },
                  ),
                ),
              ),
            )),
        automaticallyImplyLeading: false,
        title: Text(
          reviews_labe,
          style: TextStyle(
              color: textnavy, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 170,
              child: Card(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      ListTile(
                        titleAlignment: ListTileTitleAlignment.threeLine,
                        leading: CircleAvatar(
                            radius: 20, backgroundImage: NetworkImage('')),
                        title: Text(
                          'Palm Siriphun',
                          style: TextStyle(
                              fontFamily: 'LINESeedSansTHRg',
                              fontSize: 18,
                              color: textnavy),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          children: [
                            Text('คะแนน'),
                            Padding(padding: EdgeInsets.only(left: 5)),
                            RatingBar.builder(
                              initialRating:
                                  _initialRating, // use product rating from data
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 15.0,
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        titleAlignment: ListTileTitleAlignment.threeLine,
                        title: Text(
                          comment,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyle(
                              fontFamily: 'LINESeedSansTHRg',
                              fontSize: 16,
                              color: textgrey),
                        ),
                      ),
                    ],
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
