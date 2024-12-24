import 'package:t_store/features/shop/features/all_brands/domain/entities/brand_entity.dart';

abstract class BrandState {
  const BrandState();
}

class BrandInitial extends BrandState {}

class BrandLoading extends BrandState {}

class BrandLoaded extends BrandState {
  final List<BrandEntity> brands;

  const BrandLoaded({required this.brands});
}

class BrandError extends BrandState {
  final String message;

  const BrandError({required this.message});
}
