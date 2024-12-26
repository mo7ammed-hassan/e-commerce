import 'package:t_store/features/shop/features/store/domain/brand_category_entity.dart';

class BrandCategoryModel {
  final String brandId;
  final String categoryId;

  BrandCategoryModel({
    required this.brandId,
    required this.categoryId,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'brandId': brandId,
      'categoryId': categoryId,
    };
  }

  factory BrandCategoryModel.fromJson(Map<String, dynamic> map) {
    return BrandCategoryModel(
      brandId: map['brandId'] as String,
      categoryId: map['categoryId'] as String,
    );
  }

  // empty model
  static BrandCategoryModel empty =
      BrandCategoryModel(brandId: '', categoryId: '');
}

// to entity

extension BrandCategoryModelX on BrandCategoryModel {
  BrandCategoryEntity toEntity() {
    return BrandCategoryEntity(brandId: brandId, categoryId: categoryId);
  }
}
