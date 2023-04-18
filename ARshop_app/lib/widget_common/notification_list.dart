import 'package:ARshop_App/utils/consts.dart';

class nofification_list extends StatelessWidget {
  const nofification_list({super.key});

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
                    style: TextStyle(fontSize: 16, color: textnavy),
                  ),
                  trailing: InkWell(
                    onTap: () {},
                    child: Text('เลือกอ่านทั้งหมด'),
                  ),
                ),
              ),
              Container(
                child: Card(
                  child: ListTile(
                    leading: Text('test'),
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
