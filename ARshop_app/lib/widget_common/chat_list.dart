import 'package:ARshop_App/utils/consts.dart';
import 'package:material_symbols_icons/rounded.dart';

class chat_list extends StatelessWidget {
  const chat_list({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 12, right: 12),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                child: ListTile(
                  leading: Text(
                    'ข้อความล่าสุด',
                    style: TextStyle(fontSize: 18, color: textnavy),
                  ),
                  trailing: InkWell(
                    onTap: () {},
                    child: Text('เลือกอ่านทั้งหมด'),
                  ),
                ),
              ),
              Container(
                child: Card(
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        ListTile(
                          leading: Wrap(
                            children: [
                              Icon(
                                MaterialSymbols.chat_bubble,
                                color: textblue,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'ณ เณอ | Chor Cher',
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                          trailing: Wrap(
                            children: [
                              Icon(MaterialSymbols.navigate_next),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 50, bottom: 20),
                              child: Container(
                                width: 300,
                                child: Text(
                                  'ขอบคุณมากครับ ',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: 'LINESeedSansTHRg',
                                    fontSize: 16,
                                    color: textgrey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        ListTile(
                          trailing: Padding(
                            padding: EdgeInsets.only(right: 16, bottom: 20),
                            child: Text(
                              '30 มี.ค. 2022',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontFamily: 'LINESeedSansTHRg',
                                fontSize: 16,
                                color: textgrey,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
