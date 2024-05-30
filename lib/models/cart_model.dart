import 'package:shamo/models/product_model.dart';

class CartModel {
  final int? id;
  ProductModel? product;
  int quantity;

  CartModel({
    this.id,
    this.product,
    required this.quantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'] as int?,
      product: json['product'] != null
          ? ProductModel.fromJson(json['product'])
          : null,
      quantity: json['quantity'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product?.toJson(),
      'quantity': quantity,
    };
  }

  double getTotalPrice() {
    // Gunakan operator null-aware (?.) untuk menghindari error jika product null
    return product!.price * quantity;
  }
}
