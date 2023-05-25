import 'package:ARshop_App/page/profile.dart';
import 'package:ARshop_App/utils/consts.dart';
import 'package:material_symbols_icons/rounded.dart';

import '../api/API_Service.dart';
import '../models/GetProfile.dart';

class edit_profile extends StatefulWidget {
  const edit_profile({super.key});

  @override
  State<edit_profile> createState() => _edit_profileState();
}

class _edit_profileState extends State<edit_profile> {
  @override
  Widget build(BuildContext context) {
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
                        Navigator.of(context).pop(MaterialPageRoute(
                          builder: (BuildContext context) => profile(),
                        ));
                      },
                    ),
                  ),
                ),
              )),
          title: Text(
            'แก้ไขโปรไฟล์',
            style: TextStyle(color: textnavy),
          ),
        ),
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 0.1,
                child: FutureBuilder<GetProfileResponse>(
                  future: APIService.getUserProfile(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final profile = snapshot.data!;
                      return ListTile(
                        leading: Text(
                          'ชื่อ',
                          style: TextStyle(fontSize: 18, color: textnavy),
                        ),
                        trailing: Wrap(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                profile.name,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'LINESeedSansTHRg',
                                    color: textnavy),
                              ),
                            ),
                            SizedBox(
                              width: 1,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(MaterialSymbols.navigate_next))
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ),
            FutureBuilder<GetProfileResponse>(
                future: APIService.getUserProfile(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final profile = snapshot.data;
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        elevation: 0.1,
                        child: ListTile(
                          leading: Text(
                            'เบอร์โทร',
                            style: TextStyle(fontSize: 18, color: textnavy),
                          ),
                          trailing: Wrap(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  profile!.tel,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'LINESeedSansTHRg',
                                      color: textnavy),
                                ),
                              ),
                              SizedBox(
                                width: 1,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(MaterialSymbols.navigate_next))
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            FutureBuilder<GetProfileResponse>(
                future: APIService.getUserProfile(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final profile = snapshot.data;
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        elevation: 0.1,
                        child: ListTile(
                          leading: Text(
                            'อีเมล',
                            style: TextStyle(fontSize: 18, color: textnavy),
                          ),
                          trailing: Wrap(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  profile!.email,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'LINESeedSansTHRg',
                                      color: textnavy),
                                ),
                              ),
                              SizedBox(
                                width: 1,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(MaterialSymbols.navigate_next))
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 0.1,
                child: ListTile(
                  leading: Text(
                    'จัดการบัญชี',
                    style: TextStyle(fontSize: 18, color: textnavy),
                  ),
                  trailing: Wrap(
                    children: [
                      SizedBox(
                        width: 1,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(MaterialSymbols.navigate_next))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
