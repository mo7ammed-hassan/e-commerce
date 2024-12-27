import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/shop/features/all_products/domain/entity/product_entity.dart';

class SortableProductCubit extends Cubit<List<ProductEntity>> {
  SortableProductCubit() : super(List<ProductEntity>.empty());

  String sortOption = 'Name';

  void sortProducts(String sortBy) {
    sortOption = sortBy;
    switch (sortBy) {
      case 'Name':
        state.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Higher Price':
        state.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Lower Price':
        state.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Sale':
        state.sort((a, b) {
          if (a.salePrice != null && b.salePrice != null) {
            return a.salePrice!.compareTo(b.salePrice!);
          } else {
            return a.price.compareTo(b.price);
          }
        });
        break;
      case 'Newest':
        state.sort((a, b) => a.date!.compareTo(b.date!));
        break;

      default:
        state.sort((a, b) => a.title.compareTo(b.title));
    }

    if (isClosed) return;

    emit(List.from(state));
  }

  void resetProducts(List<ProductEntity> products) {
    if (isClosed) return;
    emit(List.from(products));
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      if (isClosed) return;
      emit(List.from(state));
    } else {
      emit(
        List.from(
          state.where(
            (product) {
              return product.title.toLowerCase().contains(query.toLowerCase());
            },
          ).toList(),
        ),
      );
    }
  }
}
