class ProductVariationEntity {
  final String id;
  final String? sku;
  final String image;
  final String? description;
  final double price;
  final double? salePrice;
  final int stock;
  final Map<String, String> attributeValues; // Defaults to an empty map

  const ProductVariationEntity({
    required this.id,
    this.sku,
    required this.image,
    this.description,
    required this.price,
    this.salePrice,
    required this.stock,
    this.attributeValues = const {},
  });
}