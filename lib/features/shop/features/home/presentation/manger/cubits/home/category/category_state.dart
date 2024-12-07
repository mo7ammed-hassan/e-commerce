part of 'category_cubit.dart';

sealed class CategoryState {
  const CategoryState();
}

final class CategoryInitial extends CategoryState {
  const CategoryInitial();
}

final class CategoryLoadingState extends CategoryState {
  const CategoryLoadingState();
}

final class CategoryLoadedState extends CategoryState {
  final List<CategoryEntity> allCategories;
  final List<CategoryEntity> featuredCategories;

  const CategoryLoadedState(this.allCategories, this.featuredCategories);
}

final class CategoryFailureState extends CategoryState {
  final String errorMessage;

  const CategoryFailureState(this.errorMessage);
}
