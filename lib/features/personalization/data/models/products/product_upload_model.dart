// product_upload_model.dart

import 'package:t_store/features/personalization/data/models/products/product_attribute_upload_model.dart';
import 'package:t_store/features/personalization/data/models/products/product_variation_upload_model.dart';
import 'package:t_store/features/shop/features/all_brands/data/brand_model.dart';

class ProductUploadModel {
  String id;
  int? stock;
  num price;
  String title;
  String sku;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String> images;
  String productType;
  List<ProductAttributeUploadModel> productAttributes;
  List<ProductVariationUploadModel> productVariations;

  ProductUploadModel({
    required this.id,
    this.stock,
    required this.price,
    required this.title,
    required this.sku,
    this.date,
    required this.salePrice,
    required this.thumbnail,
    this.isFeatured,
    this.brand,
    this.description,
    this.categoryId,
    this.images = const [],
    required this.productType,
    this.productAttributes = const [],
    this.productVariations = const [],
  });

  // Future<void> uploadData(String collection) async {
  //   try {
  //     final thumbnailFile = await getIt<FirebaseStorageServices>().getImageDataFromAssets(thumbnail);
  //     final thumbnailUrl = await getIt<FirebaseStorageServices>().uploadImageData(collection, thumbnailFile, thumbnail);
  //     thumbnail = thumbnailUrl;

  //     if (images.isNotEmpty) {
  //       List<String> imageUrls = [];
  //       for (var image in images) {
  //         final imageFile = await getIt<FirebaseStorageServices>().getImageDataFromAssets(image);
  //         final imageUrl = await getIt<FirebaseStorageServices>().uploadImageData(collection, imageFile, image);
  //         imageUrls.add(imageUrl);
  //       }
  //       images = imageUrls;
  //     }

  //     if (productVariations.isNotEmpty) {
  //       for (var variation in productVariations) {
  //         final variationImageFile = await getIt<FirebaseStorageServices>().getImageDataFromAssets(variation.image);
  //         final variationImageUrl = await getIt<FirebaseStorageServices>().uploadImageData(collection, variationImageFile, variation.image);
  //         variation.image = variationImageUrl;
  //       }
  //     }

  //     // Upload to Firestore
  //     await FirebaseFirestore.instance
  //         .collection(collection)
  //         .doc(id)
  //         .set(toJson());
  //   } catch (e) {
  //     throw 'Something went wrong $e';
  //   }
  // }

  Map<String, dynamic> toJson() {
    return {
      'stock': stock,
      'price': price,
      'title': title,
      'sku': sku,
      'salePrice': salePrice,
      'thumbnail': thumbnail,
      'isFeatured': isFeatured,
      'brand': brand?.toJson(),
      'description': description,
      'categoryId': categoryId,
      'images': images,
      'productType': productType,
      'productAttributes': productAttributes.map((e) => e.toJson()).toList(),
      'productVariations': productVariations.map((e) => e.toJson()).toList(),
    };
  }

  factory ProductUploadModel.fromJson(Map<String, dynamic> data) {
    return ProductUploadModel(
      id: data['id'],
      stock: data['stock'],
      price: data['price'],
      title: data['title'],
      sku: data['sku'],
      salePrice: data['salePrice'],
      thumbnail: data['thumbnail'],
      isFeatured: data['isFeatured'],
      brand: data['brand'] != null ? BrandModel.fromJson(data['brand']) : null,
      description: data['description'],
      categoryId: data['categoryId'],
      images: List<String>.from(data['images'] ?? []),
      productType: data['productType'],
      productAttributes: (data['productAttributes'] as List)
          .map((e) => ProductAttributeUploadModel.fromJson(e))
          .toList(),
      productVariations: (data['productVariations'] as List)
          .map((e) => ProductVariationUploadModel.fromJson(e))
          .toList(),
    );
  }
}
