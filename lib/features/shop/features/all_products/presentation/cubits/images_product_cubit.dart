import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/shop/features/all_products/domain/entity/product_entity.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ImagesProductCubit extends Cubit<String> {
  ImagesProductCubit() : super('');

  /// Stores the currently selected image
  String selectedImage = '';

  /// Retrieves all unique product images, including from variations
  List<String> getAllProductImages(ProductEntity product) {
    final Set<String> images = {};

    // Add the thumbnail as the default image
    if (product.thumbnail.isNotEmpty) {
      images.add(product.thumbnail);
      selectedImage = product.thumbnail; // Default to the thumbnail
    }

    // Add images from the product model if available
    if (product.images != null && product.images!.isNotEmpty) {
      images.addAll(product.images!);
    }

    // Add images from product variations if available
    if (product.productVariations != null &&
        product.productVariations!.isNotEmpty) {
      images.addAll(
        product.productVariations!
            .map((variation) => variation.image)
            .where((image) => image.isNotEmpty),
      );
    }

    emit(selectedImage);
    return images.toList();
  }

  /// Displays an enlarged version of the selected image in a fullscreen dialog
 

  /// Updates the selected image and emits its value
  void selectImage(String image) {
    selectedImage = image;
    emit(selectedImage);
  }
}
