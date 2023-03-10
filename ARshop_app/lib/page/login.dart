import 'package:http/http.dart' as http;
import 'package:ARshop_App/utils/consts.dart';
import 'package:ARshop_App/api/api_provider.dart';

class login extends StatefulWidget {
  @override
  LoginPage createState() => LoginPage();
}

class LoginPage extends State<login> {
  final apiProvider = ApiProvider();
  final _formkey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final focusNode = FocusNode();

  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.25,
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
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => Homepage(),
                        ));
                      },
                    ),
                  ),
                ),
              )),
          automaticallyImplyLeading: false,
          title: Text(
            'เข้าสู่ระบบ',
            style: TextStyle(
                color: Color.fromARGB(255, 23, 43, 77),
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
        ),
        body: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 100.0)),
                Column(
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 50.0),
                        child: Container(
                          width: 300.0,
                          height: 130.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('asset/icon_arshop.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Container(
                          width: 300.0,
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter username';
                              }
                              return null;
                            },
                            controller: usernameController,
                            decoration: InputDecoration(
                                isDense: true,
                                filled: true,
                                fillColor: Colors.grey[200],
                                prefix: Container(
                                  width: 10,
                                  height: 10,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.9,
                                    color: Color.fromARGB(500, 63, 81, 181),
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                hintText: emailHint,
                                hintStyle: TextStyle(color: textgreyopacity)),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: 30.0),
                        child: Container(
                          width: 300.0,
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter password';
                              }
                            },
                            controller: passwordController,
                            obscureText: hidePassword,
                            decoration: InputDecoration(
                                isDense: true,
                                filled: true,
                                fillColor: Colors.grey[200],
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  },
                                  child: Icon(
                                    hidePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.black,
                                  ),
                                ),
                                prefix: Container(
                                  width: 10,
                                  height: 10,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.9,
                                    color: Color.fromARGB(500, 63, 81, 181),
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                hintText: passwordHint,
                                hintStyle: TextStyle(color: textgreyopacity)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 55),
                                  child: TextButton(
                                      onPressed: () {},
                                      child: forgetpass.text
                                          .color(textnavy)
                                          .make()),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 25.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                                String username = usernameController.text;
                                String password = passwordController.text;

                                String token = await apiProvider.login(
                                    username, password, context);

                                print('Token: $token');

                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) => Homepage(),
                                ));
                              }
                            },
                            child: Text(
                                style:
                                    TextStyle(fontFamily: 'LINESeedSansTH-Rg'),
                                'เข้าสู่ระบบ'),
                            style: ButtonStyle(
                                textStyle: MaterialStateProperty.all(TextStyle(
                                  fontSize: 16.0,
                                )),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    const Size(300, 60)),
                                backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 23, 43, 77),
                                )),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 23, 43, 77),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18),
                                    'ยังไม่มีบัญชีผู้ใช้?'),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Column(
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        register()));
                                          },
                                          child: register_text.text
                                              .color(textblue)
                                              .make())
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
