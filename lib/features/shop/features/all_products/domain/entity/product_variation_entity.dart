class ProductVariationEntity {
  final String id;
  String? sku;
  String image;
  String? description;
  double price;
  double? salePrice;
  int stock;
  Map<String, String> attributeValues;

  ProductVariationEntity({
    required this.id,
    this.sku,
    required this.image,
    this.description,
    required this.price,
    this.salePrice,
    required this.stock,
    required this.attributeValues,
  });
}
