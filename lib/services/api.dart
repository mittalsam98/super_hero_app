import 'dart:convert';

import 'package:http/http.dart' as http;

const String token = '836211930121768';
const String url = 'https://www.superheroapi.com/api.php/$token/search';

class ApiCall {
  ApiCall({this.text});
  final String text;
  Future search() async {
    http.Response response = await http.get(url + text.trim());
    return json.decode(response.body);
  }
}
