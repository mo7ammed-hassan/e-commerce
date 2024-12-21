import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/shop/features/all_products/domain/entity/product_entity.dart';

class ImagesProductCubit extends Cubit<String> {
  ImagesProductCubit() : super('');

  String selectedImage = '';

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

  void selectImage(String image) {
    // Only update if a valid image is provided
    if (image.isNotEmpty) {
      selectedImage = image;
      emit(selectedImage);
    }
  }
}
