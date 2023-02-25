import 'package:ARshop_App/utils/consts.dart';

Widget custom_textfield() {
  return Column(
    children: [
      TextFormField(
        decoration: InputDecoration(
          hintText: emailHint,
          hintStyle: TextStyle(color: textgrey),
          isDense: true,
          filled: true,
          fillColor: Colors.grey[200],
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: textblue,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      )
    ],
  );
}
