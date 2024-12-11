import 'package:t_store/features/shop/features/all_brands/domain/entities/brand_entity.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productCount;

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    required this.productCount,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'isFeatured': isFeatured,
      'productCount': productCount,
    };
  }

  factory BrandModel.fromJson(Map<String, dynamic> map) {
    return BrandModel(
      id: map['id'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
      isFeatured: map['isFeatured'] as bool,
      productCount: map['productCount'] as int,
    );
  }
}

extension BrandXModel on BrandModel {
  BrandEntity toEntity() {
    return BrandEntity(
      id: id,
      name: name,
      image: image,
      isFeatured: isFeatured ?? false,
      productCount: productCount ?? 0,
    );
  }
}
