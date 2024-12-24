import 'package:dartz/dartz.dart';
import 'package:t_store/features/shop/features/all_brands/domain/entities/brand_entity.dart';

abstract class BrandsRepository {
  // -- Get Featured Brands --
  Future<Either<String, List<BrandEntity>>> getFeaturedBrands({required int limit});

  // --Get All Brands--
  Future<Either<String, List<BrandEntity>>> getAllBrands({required int limit});
}
