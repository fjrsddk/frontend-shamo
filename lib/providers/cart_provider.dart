import 'package:flutter/material.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/models/product_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];

  List<CartModel> get cart => _carts;

  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  addCart(ProductModel product) {
    if (productExist(product)) {
      int index =
          _carts.indexWhere((element) => element.product!.id == product.id);
      _carts[index];
    } else {
      _carts.add(CartModel(
        id: _carts.length,
        product: product,
        quantity: 1,
      ));
    }
    notifyListeners();
  }

  removeCart(int id) {
    _carts.removeAt(id);
    notifyListeners();
  }

  addQuantity(int id) {
    _carts[id].quantity++;
    notifyListeners();
  }

  reduceQuantity(int id) {
    _carts[id].quantity--;
    if (_carts[id].quantity == 0) {
      _carts.removeAt(id);
    }
    notifyListeners();
  }

  int totalItems() {
    // Tambahkan tipe kembalian untuk method totalItems()
    int total = 0;
    for (var item in _carts) {
      total += item.quantity;
    }
    return total;
  }

  double totalPrice() {
    // Tambahkan tipe kembalian untuk method totalPrice()
    double total = 0;
    for (var item in _carts) {
      total += (item.quantity! * item.product!.price);
    }
    return total; // Kembalikan nilai total
  }

  bool productExist(ProductModel product) {
    // Ubah tipe kembalian menjadi bool
    return _carts.indexWhere((element) => element.product!.id == product.id) !=
        -1; // Mengembalikan nilai true jika produk ada, false jika tidak
  }
}
