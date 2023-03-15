import 'package:ARshop_App/api/API_Service.dart';
import 'package:ARshop_App/api/config.dart';
import 'package:ARshop_App/models/register_request.dart';
import 'package:flutter/material.dart';
import 'package:ARshop_App/page/login.dart';
import 'package:ARshop_App/utils/consts.dart';
import 'package:flutter/services.dart';

bool hidePassword = true;

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  bool isAPIcallProcess = false;
  final apiProvider = ApiProvider();
  final _formkey = GlobalKey<FormState>();
  final focusNode = FocusNode();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final telController = TextEditingController();
  final customerBirthdateController = TextEditingController();
  final customerGenderController = TextEditingController();
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
                        Navigator.of(context).pop(MaterialPageRoute(
                            builder: (BuildContext context) => login()));
                      },
                    ),
                  ),
                ),
              )),
          automaticallyImplyLeading: false,
          title: Text(
            'สมัครสมาชิก',
            style: TextStyle(
                color: Color.fromARGB(255, 23, 43, 77),
                fontFamily: 'LINESeedSansTH',
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
        ),
        body: Form(
          key: _formkey,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 50.0)),
                Center(
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 30.0),
                          child: Container(
                            width: 300.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('asset/icon_arshop.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Column(
                            children: [
                              register_title.text
                                  .color(textnavy)
                                  .size(30)
                                  .make(),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.fromLTRB(55, 0, 0, 0),
                          child: Column(
                            children: [
                              email_label.text.color(textnavy).size(16).make(),
                            ],
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
                                    return 'กรุณากรอกอีเมลผู้ใช้';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: emailController,
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
                                    hintText: example_email_hint,
                                    hintStyle:
                                        TextStyle(color: textgreyopacity)),
                                keyboardType: TextInputType.emailAddress,
                                maxLength: 255,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.none),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.fromLTRB(55, 10, 0, 0),
                          child: Column(
                            children: [
                              username_label.text
                                  .color(textnavy)
                                  .size(16)
                                  .make(),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Container(
                            width: 300.0,
                            child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'กรุณากรอกชื่อผู้ใช้';
                                  } else {
                                    return null;
                                  }
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
                                    hintText: username_label,
                                    hintStyle:
                                        TextStyle(color: textgreyopacity)),
                                maxLength: 255,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.none),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.fromLTRB(55, 10, 0, 0),
                          child: Column(
                            children: [
                              phone_number_label.text
                                  .color(textnavy)
                                  .size(16)
                                  .make(),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Container(
                            width: 300.0,
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'กรุณากรอกเบอร์โทร';
                                }
                                return null;
                              },
                              controller: telController,
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
                                  hintText: phone_number,
                                  hintStyle: TextStyle(color: textgreyopacity)),
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                              maxLengthEnforcement: MaxLengthEnforcement.none,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.fromLTRB(55, 10, 0, 0),
                          child: Column(
                            children: [
                              birthdate_label.text
                                  .color(textnavy)
                                  .size(16)
                                  .make(),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Container(
                            width: 300.0,
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'กรุณาเลือก วัน/เดือน/ปีเกิด';
                                }
                                return null;
                              },
                              onTap: () async {
                                DateTime? date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now());
                                if (date != null) {
                                  String formattedDate =
                                      "${date.year.toString().padLeft(2, '0')}-"
                                      "${date.month.toString().padLeft(2, '0')}-"
                                      "${date.day.toString()}";
                                  customerBirthdateController.text =
                                      formattedDate;
                                }
                              },
                              controller: customerBirthdateController,
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
                                  hintText: birthdate_select_hint,
                                  hintStyle: TextStyle(color: textgreyopacity)),
                              keyboardType: TextInputType.datetime,
                              maxLength: 10,
                              maxLengthEnforcement: MaxLengthEnforcement.none,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.fromLTRB(55, 10, 0, 0),
                          child: Column(
                            children: [
                              gender_label.text.color(textnavy).size(16).make(),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Container(
                            width: 300.0,
                            child: DropdownButtonFormField<String>(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null) {
                                  return 'กรุณาเลือกเพศผู้ใช้งาน';
                                }
                                return null;
                              },
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
                                hintText: 'เลือกเพศ',
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                              items: ['ชาย', 'หญิง', 'อื่นๆ']
                                  .map((gender) => DropdownMenuItem<String>(
                                        value: gender,
                                        child: Text(gender),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                if (value == 'ชาย') {
                                  customerGenderController.text = 'male';
                                } else if (value == 'หญิง') {
                                  customerGenderController.text = 'female';
                                } else {
                                  customerGenderController.text = '';
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.fromLTRB(55, 10, 0, 0),
                          child: Column(
                            children: [
                              password_label.text
                                  .color(textnavy)
                                  .size(16)
                                  .make(),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Container(
                            width: 300.0,
                            child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'กรุณากรอกรหัสผ่าน';
                                  }
                                  return null;
                                },
                                obscureText: true,
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
                                    hintText: hintpassword,
                                    hintStyle:
                                        TextStyle(color: textgreyopacity)),
                                maxLength: 255,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.none),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.fromLTRB(55, 10, 0, 0),
                          child: Column(
                            children: [
                              confrim_password_label.text
                                  .color(textnavy)
                                  .size(16)
                                  .make(),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Container(
                            width: 300.0,
                            child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'กรุณากยืนยันรหัสผ่าน';
                                  }
                                  return null;
                                },
                                obscureText: true,
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
                                    hintText: hintpassword,
                                    hintStyle:
                                        TextStyle(color: textgreyopacity)),
                                maxLength: 255,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.none),
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
                                  setState(() {
                                    isAPIcallProcess = true;
                                  });
                                  String email = emailController.text;
                                  String username = usernameController.text;
                                  String telephone = telController.text;
                                  String password = passwordController.text;
                                  String confirmpassword =
                                      confirmPasswordController.text;
                                  String gender = customerGenderController.text;
                                  String customerBirthdate =
                                      customerBirthdateController.text;
                                  RegisterRequestModel model =
                                      RegisterRequestModel(
                                          customerEmail: email,
                                          customerPassword: password,
                                          customerConfirmPassword:
                                              confirmpassword,
                                          customerName: username,
                                          customerTel: telephone,
                                          customerGender: gender,
                                          customerBirthdate: customerBirthdate);
                                  APIService.register(model).then((response) =>
                                      {
                                        if (response.token != null)
                                          {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        Config_api.appName),
                                                    content: Text(
                                                        "สมัครสมาชิกสำเร็จ"),
                                                  );
                                                }),
                                            Future.delayed(Duration(seconds: 1),
                                                () {
                                              Navigator.of(context).pop();
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        login(),
                                              ));
                                            })
                                          }
                                      });

                                  Navigator.of(context).pop();
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) => login(),
                                  ));
                                }
                              },
                              child: Text(
                                  style: TextStyle(
                                      fontFamily: 'LINESeedSansTH-Rg'),
                                  'สมัครสมาชิก'),
                              style: ButtonStyle(
                                  textStyle:
                                      MaterialStateProperty.all(TextStyle(
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
                                          color:
                                              Color.fromARGB(255, 23, 43, 77),
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18),
                                      'มีบัญชีผู้ใช้อยู่แล้ว?'),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Column(
                                      children: [
                                        TextButton(
                                            onPressed: () async {
                                              Navigator.of(context).pop(
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          login()));
                                            },
                                            child: login_text.text
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
