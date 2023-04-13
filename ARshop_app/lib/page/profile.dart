import 'package:ARshop_App/page/product.dart';
import 'package:ARshop_App/service/shared_service.dart';
import 'package:ARshop_App/utils/consts.dart';
import 'package:material_symbols_icons/rounded.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  String _username = 'Palm Siriphun';
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
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Card(
                elevation: 0.10,
                child: ListTile(
                  titleAlignment: ListTileTitleAlignment.threeLine,
                  leading: CircleAvatar(
                      radius: 20, backgroundImage: NetworkImage('')),
                  title: Text(
                    'Palm Siriphun',
                    style: TextStyle(fontSize: 18, color: textnavy),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.all(10)),
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
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 0.0,
                      color: Color.fromRGBO(235, 238, 251, 0.973),
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.all(20),
                            leading: Icon(
                              MaterialSymbols.credit_card,
                              color: textnavy,
                              weight: 700,
                            ),
                            title: Text(
                              profile_payment[0],
                              style: TextStyle(color: textnavy),
                            ),
                            trailing: Icon(
                              MaterialSymbols.arrow_forward_ios,
                              color: textnavy,
                              weight: 700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 0.0,
                      color: Color.fromRGBO(235, 238, 251, 0.973),
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.all(20),
                            leading: Icon(
                              MaterialSymbols.package,
                              color: textnavy,
                              weight: 700,
                            ),
                            title: Text(
                              profile_payment[1],
                              style: TextStyle(color: textnavy),
                            ),
                            trailing: Icon(
                              MaterialSymbols.arrow_forward_ios,
                              color: textnavy,
                              weight: 700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 0.0,
                      color: Color.fromRGBO(235, 238, 251, 0.973),
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.all(20),
                            leading: Icon(
                              MaterialSymbols.local_shipping,
                              color: textnavy,
                              weight: 700,
                            ),
                            title: Text(
                              profile_payment[2],
                              style: TextStyle(color: textnavy),
                            ),
                            trailing: Icon(
                              MaterialSymbols.arrow_forward_ios,
                              color: textnavy,
                              weight: 700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 0.0,
                      color: Color.fromRGBO(235, 238, 251, 0.973),
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.all(20),
                            leading: Icon(
                              MaterialSymbols.rate_review,
                              color: textnavy,
                              weight: 700,
                            ),
                            title: Text(
                              profile_payment[3],
                              style: TextStyle(color: textnavy),
                            ),
                            trailing: Icon(
                              MaterialSymbols.arrow_forward_ios,
                              color: textnavy,
                              weight: 700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 0.0,
                      color: Color.fromRGBO(235, 238, 251, 0.973),
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.all(20),
                            leading: Icon(
                              MaterialSymbols.assignment_return,
                              color: textnavy,
                              weight: 700,
                            ),
                            title: Text(
                              profile_payment[4],
                              style: TextStyle(color: textnavy),
                            ),
                            trailing: Icon(
                              MaterialSymbols.arrow_forward_ios,
                              color: textnavy,
                              weight: 700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: TextButton(
                  onPressed: () async {
                    SharedService.logout(context);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: textnavy,
                  ),
                  child: Text(
                    'ออกจากระบบ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
