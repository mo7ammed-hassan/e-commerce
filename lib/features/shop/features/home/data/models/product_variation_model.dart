
class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    required this.sku,
    required this.image,
    this.description,
    required this.price,
    required this.salePrice,
    required this.stock,
    required this.attributeValues,
  });

  static ProductVariationModel empty() => ProductVariationModel(
        id: '',
        sku: '',
        image: '',
        description: '',
        price: 0.0,
        salePrice: 0.0,
        stock: 0,
        attributeValues: {},
      );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'sku': sku,
      'image': image,
      'description': description,
      'price': price,
      'salePrice': salePrice,
      'stock': stock,
      'attributeValues': attributeValues,
    };
  }

  factory ProductVariationModel.fromJson(Map<String, dynamic> data) {
    return ProductVariationModel(
      id: data['id'] ?? '',
      sku: data['sku'] ?? '',
      image: data['image'] ?? '',
      description:
          data['description'] != null ? data['description'] ?? '' : null,
      price: double.parse((data['price'] ?? 0.0).toString()),
      salePrice: double.parse((data['salePrice'] ?? 0.0).toString()),
      stock: data['stock'] ?? 0,
      attributeValues: Map<String, String>.from(
        (data['attributeValues']),
      ),
    );
  }
}
