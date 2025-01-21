import 'package:dartz/dartz.dart';
import 'package:t_store/common/core/errors/failures.dart';
import 'package:t_store/common/core/usecases/use_cases.dart';
import 'package:t_store/features/shop/features/cart/data/models/cart_item_model.dart';
import 'package:t_store/features/shop/features/cart/domain/repositories/cart_repository.dart';

class AddSingleCartItemUseCase
    extends UseCases<Either<Failure, void>, CartItemModel> {
  final CartRepository _cartRepository;

  AddSingleCartItemUseCase(this._cartRepository);

  @override
  Future<Either<Failure, void>> call({CartItemModel? params}) async {
    return await _cartRepository.addSingleItemToCart(cartItem: params!);
  }
}
