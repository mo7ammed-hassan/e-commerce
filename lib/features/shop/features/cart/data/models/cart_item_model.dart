import 'package:t_store/features/shop/features/cart/domain/entities/cart_item_entity.dart';

class CartItemModel {
  String title;
  String? imageUrl;
  int quantity;
  double price;
  String? variationId;
  String productId;
  String? brandName;
  Map<String, dynamic>? selectedVariation;

  CartItemModel({
    this.title = '',
    this.imageUrl,
    required this.quantity,
    this.price = 0.0,
    this.variationId = '',
    required this.productId,
    this.brandName,
    this.selectedVariation,
  });

  // --Converte a CaterItem to Json Map--
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'imageUrl': imageUrl,
      'quantity': quantity,
      'price': price,
      'variationId': variationId,
      'productId': productId,
      'brandname': brandName,
      'selectedVariation': selectedVariation,
    };
  }

  // -- Converte a Json Map to CaterItem --
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String?,
      quantity: json['quantity'] as int,
      price: json['price'] as double,
      variationId: json['variationId'] as String?,
      productId: json['productId'] as String,
      brandName: json['brandname'] as String?,
      selectedVariation: json['selectedVariation'] as Map<String, dynamic>?,
    );
  }

  // -- Empty CartItem --
  factory CartItemModel.empty() => CartItemModel(quantity: 0, productId: '');
}

extension CartItemModelExtension on CartItemModel {
  CartItemEntity toEntity() => CartItemEntity(
        title: title,
        imageUrl: imageUrl,
        quantity: quantity,
        price: price,
        variationId: variationId,
        productId: productId,
        brandName: brandName,
        selectedVariation: selectedVariation,
      );
}
