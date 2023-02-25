import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';

class ApiProcider {
  ApiProcider();
  String endPoint = 'https://fakestoreapi.com/auth';
  Future<http.Response> submit_login(String username, String password) async {
    final url = Uri.parse('$endPoint/login');
    var body = {"mor_2314": username, "83r5^_": password};
    return await http.post(url, body: body);
  }
}
