
import 'package:http/http.dart' as http;
import 'dart:convert';

final String apiUrl = "https://610183924e50960017c29e8d.mockapi.io/product/getUser";

Future<List<dynamic>> fetchUsers() async {

  var result = await http.get(apiUrl);
  return json.decode(result.body)['results'];

}
