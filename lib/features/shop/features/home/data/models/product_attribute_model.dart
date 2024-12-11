
class ProductAttributeModel {
  String? name;
  List<String>? values;

  ProductAttributeModel({
    required this.name,
    required this.values,
  });

  static ProductAttributeModel empty() => ProductAttributeModel(
        name: '',
        values: [],
      );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'values': values,
    };
  }

  factory ProductAttributeModel.fromJson(Map<String, dynamic> data) {
    return ProductAttributeModel(
      name: data['name'] ?? '',
      values: List<String>.from(
        (data['values']),
      ),
    );
  }
}
