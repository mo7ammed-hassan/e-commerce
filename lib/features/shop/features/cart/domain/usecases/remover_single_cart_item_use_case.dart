import 'package:dartz/dartz.dart';
import 'package:t_store/common/core/errors/failures.dart';
import 'package:t_store/common/core/usecases/use_cases.dart';
import 'package:t_store/features/shop/features/cart/domain/entities/cart_item_entity.dart';
import 'package:t_store/features/shop/features/cart/domain/repositories/cart_repository.dart';

class RemoverSingleCartItemUseCase
    extends UseCases<Either<Failure, void>, CartItemEntity> {
  final CartRepository _cartRepository;

  RemoverSingleCartItemUseCase(this._cartRepository);

  @override
  Future<Either<Failure, void>> call({CartItemEntity? params}) async {
    return await _cartRepository.removeSingleItemFromCart(cartItem: params!);
  }
}
