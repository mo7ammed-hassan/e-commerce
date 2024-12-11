import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/features/shop/features/all_brands/data/brand_model.dart';
import 'package:t_store/features/shop/features/home/data/models/product_attribute_model.dart';
import 'package:t_store/features/shop/features/home/data/models/product_variation_model.dart';

class ProductModel {
  String id;
  int? stock;
  double price;
  String title;
  String sku;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    this.stock,
    required this.price,
    required this.title,
    required this.sku,
    this.date,
    required this.salePrice,
    required this.thumbnail,
    this.isFeatured,
    this.brand,
    this.description,
    this.categoryId,
    this.images,
    required this.productType,
    this.productAttributes,
    this.productVariations,
  });

  ProductModel.empty()
      : id = '',
        stock = null,
        price = 0.0,
        title = '',
        sku = '',
        date = null,
        salePrice = 0.0,
        thumbnail = '',
        isFeatured = false,
        brand = null,
        description = null,
        categoryId = null,
        images = null,
        productType = '',
        productAttributes = null,
        productVariations = null;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'stock': stock,
      'price': price,
      'title': title,
      'sku': sku,
      //'date': date?.toIso8601String(),
      'salePrice': salePrice,
      'thumbnail': thumbnail,
      'isFeatured': isFeatured,
      'brand': brand?.toJson(),
      'description': description,
      'categoryId': categoryId,
      'images': images,
      'productType': productType,
      'productAttributes': productAttributes != null
          ? productAttributes!
              .map(
                (e) => e.toJson(),
              )
              .toList()
          : [],
      'productVariations': productVariations != null
          ? productVariations!
              .map(
                (e) => e.toJson(),
              )
              .toList()
          : [],
    };
  }

  factory ProductModel.fromJson(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return ProductModel(
      id: document.id,
      stock: data['stock'] ?? 0,
      price: data['price'] ?? 0.0,
      title: data['title'] ?? '',
      sku: data['sku'] ?? '',
      // date:
      //     data['date'] != null ? DateTime.parse(data['date'] as String) : null,
      salePrice: data['salePrice'] as double,
      thumbnail: data['thumbnail'] ?? '',
      isFeatured: data['isFeatured'] ?? false,
      brand: BrandModel.fromJson(data['brand']),
      description: data['description'] ?? '',
      categoryId: data['categoryId'] ?? '',
      images: data['images'] != null ? List.from(data['images']) : [],
      productType: data['productType'] ?? '',
      productAttributes: (data['productAttributes'] as List<dynamic>)
          .map((e) => ProductAttributeModel.fromJson(e))
          .toList(),
      productVariations: (data['productVariations'] as List<dynamic>)
          .map((e) => ProductVariationModel.fromJson(e))
          .toList(),
    );
  }
}
