import 'package:t_store/features/shop/features/home/domain/entites/category_entity.dart';

abstract class CategoryState {
  const CategoryState();
}

class CategoryInitial extends CategoryState {
  const CategoryInitial();
}

class CategoryLoadingState extends CategoryState {
  const CategoryLoadingState();
}

class CategoryLoadedState extends CategoryState {
  final List<CategoryEntity> allCategories;
  final List<CategoryEntity> featuredCategories;

  const CategoryLoadedState(this.allCategories, this.featuredCategories);
}

class CategoryFailureState extends CategoryState {
  final String errorMessage;

  const CategoryFailureState(this.errorMessage);
}
