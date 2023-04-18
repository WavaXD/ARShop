import 'package:ARshop_App/utils/consts.dart';

class show_notification_page extends StatefulWidget {
  const show_notification_page({super.key});

  @override
  State<show_notification_page> createState() => _show_notification_pageState();
}

class _show_notification_pageState extends State<show_notification_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 240, 240, 240),
                  radius: 30.0,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    iconSize: 25.0,
                    color: Color.fromARGB(255, 23, 43, 77),
                    onPressed: () {
                      Navigator.of(context).pop(MaterialPageRoute(
                          builder: (BuildContext context) => Homepage()));
                    },
                  ),
                ),
              ),
            )),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.25,
        title: Text(
          notification_label,
          style: TextStyle(color: textnavy),
        ),
      ),
      body: Container(
        child: nofification_list(),
      ),
    );
  }
}
