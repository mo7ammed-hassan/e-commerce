import 'package:dartz/dartz.dart';
import 'package:t_store/common/core/errors/failures.dart';
import 'package:t_store/common/core/usecases/use_cases.dart';
import 'package:t_store/features/shop/features/cart/domain/repositories/cart_repository.dart';

class RemoveAllCartItemsUseCase extends UseCases<Either<Failure, void>, dynamic> {
  final CartRepository _cartRepository;

  RemoveAllCartItemsUseCase(this._cartRepository);

  @override
  Future<Either<Failure, void>> call({dynamic params}) async {
    return await _cartRepository.removeAllItemsFromCart();
  }
}
