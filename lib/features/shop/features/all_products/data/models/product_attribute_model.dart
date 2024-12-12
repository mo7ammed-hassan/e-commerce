import 'package:t_store/features/shop/features/all_products/domain/entity/product_attribute_entity.dart';

class ProductAttributeModel {
  final String name;
  final List<String> values;

  const ProductAttributeModel({
    this.name = '',
    this.values = const [],
  });

  static ProductAttributeModel empty() => const ProductAttributeModel();

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'values': values,
    };
  }

  factory ProductAttributeModel.fromJson(Map<String, dynamic> data) {
    return ProductAttributeModel(
      name: data['name'] ?? '',
      values: List<String>.from(data['values'] ?? []),
    );
  }
}

extension ProductAttributeXModel on ProductAttributeModel {
  ProductAttributeEntity toEntity() {
    return ProductAttributeEntity(
      name: name,
      values: values,
    );
  }
}
