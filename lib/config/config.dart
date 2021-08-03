import 'package:assignment_test/model/productModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ConfigURL {
    static String url ='https://610183924e50960017c29e8d.mockapi.io/product/';
  // ---------------FetchData have keys --------------
  static Future<List<ProductModel>> fetchData({final gettype ="getAllItems"}) async {
    final response = await http.get(url + gettype);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      ProductModels itemsList = ProductModels.fromJson(jsonResponse);
      // for (var item in itemsList.productModels) {
      //   print(item.name);
      // }
      return itemsList.productModels;
    } else {
      throw Exception('Failed to load post');
    }
  }

  static Future<List<ProductModel>> fetchItem({final gettype ="getAllItems"}) async {
    final response = await http.get(url + gettype);
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<ProductModel> result  =  jsonResponse.map((i) => ProductModel.fromJson(i)).toList();
      // for (var item in result) {
      //   print(item.name);
      // }
      return result;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
