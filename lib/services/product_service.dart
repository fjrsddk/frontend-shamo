import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shamo/models/product_model.dart';

class ProductService {
  String baseUrl = 'http://IP Public/api';

  Future<List<ProductModel>> getProducts() async {
    var url = Uri.parse('$baseUrl/products');
    var headers = {'Content-type': 'application/json'};

    http.Response? response; // Tipe data nullable

    try {
      response = await http.get(
        url,
        headers: headers,
      );

      print(response.body);

      if (response.statusCode == 200) {
        List<dynamic>? data =
            jsonDecode(response.body)['data']['data']; // Tipe data nullable

        if (data != null) {
          List<ProductModel> products = [];

          for (var item in data) {
            products.add(ProductModel.fromJson(item));
          }

          return products;
        } else {
          throw Exception('Data produk null');
        }
      } else {
        throw Exception('Gagal Get Products!');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Gagal Get Products!');
    }
  }
}
