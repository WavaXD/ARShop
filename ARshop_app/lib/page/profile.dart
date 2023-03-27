import 'package:ARshop_App/page/product.dart';
import 'package:ARshop_App/utils/consts.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.25,
        automaticallyImplyLeading: false,
        title: Text(
          profile_label,
          style: TextStyle(color: textnavy),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.settings_outlined,
              color: textnavy,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.menu_outlined,
              color: textnavy,
            ),
          )
        ],
      ),
      body: Container(
        child: Column(children: [
          Card(
            elevation: 0.20,
            child: ListTile(
              leading: Image.asset(img2),
              title: Text('David John'),
            ),
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.all(5)),
              Expanded(
                child: Text(
                  purchase_order_label,
                  style: TextStyle(
                    fontSize: 18,
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
              )
            ],
          )
        ]),
      ),
    );
  }
}
