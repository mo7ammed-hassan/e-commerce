class CartItemEntity {
  final String title;
  final String? imageUrl;
  final int quantity;
  final double price;
  final String? variationId;
  final String productId;
  final String? brandName;
  final Map<String, dynamic>? selectedVariation;

  CartItemEntity({
    required this.title,
    required this.imageUrl,
    required this.quantity,
    required this.price,
    required this.variationId,
    required this.productId,
    required this.brandName,
    required this.selectedVariation,
  });
}
