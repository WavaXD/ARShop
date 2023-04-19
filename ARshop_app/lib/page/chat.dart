import 'package:ARshop_App/utils/consts.dart';

class chat_page extends StatefulWidget {
  const chat_page({super.key});

  @override
  State<chat_page> createState() => _chat_pageState();
}

class _chat_pageState extends State<chat_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.25,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'กล่องข้อความ',
            style: TextStyle(color: textnavy),
          ),
        ),
      ),
      body: Container(
        child: chat_list(),
      ),
    );
  }
}
