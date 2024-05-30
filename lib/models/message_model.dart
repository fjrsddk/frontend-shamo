import 'package:shamo/models/product_model.dart';

class MessageModel {
  int? userId;
  String? userName;
  String? userImage;
  String? message;
  bool? isFromUser;
  ProductModel? product;
  DateTime? createdAt;
  DateTime? updatedAt;

  MessageModel({
    this.userId,
    this.userName,
    this.userImage,
    this.message,
    this.isFromUser,
    this.product,
    this.createdAt,
    this.updatedAt,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'] as int;
    userName = json['userName'] as String;
    userImage = json['userImage'] as String;
    message = json['message'] as String;
    isFromUser = json['isFromUser'] as bool;
    product = json['product'] == null || (json['product'] as Map).isEmpty
        ? null
        : ProductModel.fromJson(json['product']);

    createdAt =
        json['createdAt'] != null ? DateTime.tryParse(json['createdAt']) : null;
    updatedAt =
        json['updatedAt'] != null ? DateTime.tryParse(json['updatedAt']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
      'message': message,
      'isFromUser': isFromUser,
      'product': product is UninitializedProductModel ? {} : product?.toJson(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
