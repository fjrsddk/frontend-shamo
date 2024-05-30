import 'package:flutter/material.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/services/product_service.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel>? _products = [];
  List<ProductModel>? get products => _products;
  set products(List<ProductModel>? products) {
    _products = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      ProductService productService =
          ProductService(); // Buat instance dari ProductService
      List<ProductModel>? products =
          await productService.getProducts(); // Panggil metode melalui instance
      if (products != null) {
        _products = products;
        notifyListeners();
      } else {
        throw Exception('Gagal mendapatkan produk');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
