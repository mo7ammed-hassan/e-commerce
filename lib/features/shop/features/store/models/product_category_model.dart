import 'package:t_store/features/shop/features/store/domain/product_category_entity.dart';

class ProductCategoryModel {
  final String productId;
  final String categoryId;

  ProductCategoryModel({
    required this.productId,
    required this.categoryId,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'productId': productId,
      'categoryId': categoryId,
    };
  }

  factory ProductCategoryModel.fromJson(Map<String, dynamic> map) {
    return ProductCategoryModel(
      productId: map['productId'] as String,
      categoryId: map['categoryId'] as String,
    );
  }

  // empty model
  static ProductCategoryModel empty =
      ProductCategoryModel(productId: '', categoryId: '');
}

// to entity

extension ProductCategoryModelX on ProductCategoryModel {
  ProductCategoryEntity toEntity() {
    return ProductCategoryEntity(productId: productId, categoryId: categoryId);
  }
}
