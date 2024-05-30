import 'package:shamo/models/category_model.dart';
import 'package:shamo/models/gallery_model.dart';

class ProductModel {
  final int id;
  String name;
  double price;
  String? description;
  String? tags;
  CategoryModel? category;
  DateTime? createdAt;
  DateTime? updatedAt;
  late List<GalleryModel> galleries;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    this.description,
    this.tags,
    this.category,
    this.createdAt,
    this.updatedAt,
    required this.galleries,
  });

  ProductModel.empty()
      : id = 0,
        name = '',
        price = 0,
        galleries = [];

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as double,
      description: json['description'] as String?,
      tags: json['tags'] as String?,
      category: json['category'] != null
          ? CategoryModel.fromJson(json['category'])
          : null,
      galleries: (json['galleries'] as List<dynamic>?)
              ?.map((gallery) => GalleryModel.fromJson(gallery))
              .toList() ??
          [],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'tags': tags,
      'category': category!.toJson(),
      'galleries': galleries.map((gallery) => gallery.toJson()).toList(),
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
    };
  }
}

class UninitializedProductModel extends ProductModel {
  UninitializedProductModel()
      : super(
          id: 0,
          name: '',
          price: 0,
          galleries: [],
        );
}
