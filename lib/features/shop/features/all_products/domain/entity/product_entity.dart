import 'package:t_store/features/shop/features/all_brands/domain/entities/brand_entity.dart';
import 'package:t_store/features/shop/features/all_products/domain/entity/product_attribute_entity.dart';
import 'package:t_store/features/shop/features/all_products/domain/entity/product_variation_entity.dart';

class ProductEntity {
  String id;
  int? stock;
  double price;
  String title;
  String sku;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandEntity? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeEntity>? productAttributes;
  List<ProductVariationEntity>? productVariations;

  ProductEntity({
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
}
