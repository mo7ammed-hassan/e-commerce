import 'package:hive/hive.dart';
import 'package:t_store/features/shop/features/cart/domain/entities/cart_item_entity.dart';

part 'cart_item_model.g.dart'; // Required for code generation

@HiveType(typeId: 2) // Unique typeId for this model
class CartItemModel {
  @HiveField(0)
  final String productId;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String? imageUrl;

  @HiveField(3)
  int quantity; // Not final because we modify it

  @HiveField(4)
  final double price;

  @HiveField(5)
  final String? brandName;

  @HiveField(6)
  final String? variationId;

  @HiveField(7)
  final Map<String, dynamic>? selectedVariation;

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
