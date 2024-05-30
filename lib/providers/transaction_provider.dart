import 'package:flutter/material.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/services/transaction_service.dart';

class TransactionProvider with ChangeNotifier {
  Future<bool> checkout(
      {required String token,
      required List<CartModel> carts,
      required double totalPrice}) async {
    try {
      final success =
          await TransactionService().checkout(token, carts, totalPrice);
      return success;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
