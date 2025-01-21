import 'package:dartz/dartz.dart';
import 'package:t_store/common/core/errors/failures.dart';
import 'package:t_store/common/core/usecases/use_cases.dart';
import 'package:t_store/features/shop/features/all_products/data/models/product_model.dart';
import 'package:t_store/features/shop/features/cart/domain/repositories/cart_repository.dart';

class AddProductToCartUseCase
    extends UseCases<Either<Failure, void>, ProductModel> {
  final CartRepository _cartRepository;

  AddProductToCartUseCase(this._cartRepository);

  @override
  Future<Either<Failure, void>> call({ProductModel? params}) async {
    return await _cartRepository.addProductToCart(product: params!);
  }
}
