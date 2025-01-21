import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/shop/features/cart/domain/usecases/add_product_to_cart_use_case.dart';
import 'package:t_store/features/shop/features/cart/domain/usecases/add_single_cart_item_use_case.dart';
import 'package:t_store/features/shop/features/cart/domain/usecases/fetch_cart_items_use_case.dart';
import 'package:t_store/features/shop/features/cart/domain/usecases/remover_single_cart_item_use_case.dart';
import 'package:t_store/features/shop/features/cart/presentation/cubits/cart_state.dart';
import 'package:t_store/service_locator.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitialState());

  // -- Fetch Cart Items --
  void fetchCartItems() async {
    emit(CartLoadingState());
    final result = await getIt.get<FetchCartItemsUseCase>().call();
    result.fold(
      (failure) => emit(CartErrorState(failure.message)),
      (cartItems) => emit(CartLoadedState(cartItems)),
    );
  }

  // -- Add Product To Cart --
  void addProductToCart() async {
    final result = await getIt.get<AddProductToCartUseCase>().call();

    result.fold(
      (failure) => emit(CartErrorState(failure.message)),
      (_) => fetchCartItems(),
    );
  }

  // -- Remove Single Cart Item --
  void removeSingleCartItem() async {
    var result = await getIt.get<RemoverSingleCartItemUseCase>().call();
    result.fold(
      (failure) => emit(CartErrorState(failure.message)),
      (_) => fetchCartItems(),
    );
  }

  // -- Add Single Cart Item --
  void addSingleCartItem() async {
    var result = await getIt.get<AddSingleCartItemUseCase>().call();
    result.fold(
      (failure) => emit(CartErrorState(failure.message)),
      (_) => fetchCartItems(),
    );
  }

  // -- Remove All Cart Items --
  void removeAllCartItems() async {
    var result = await getIt.get<RemoverSingleCartItemUseCase>().call();
    result.fold(
      (failure) => emit(CartErrorState(failure.message)),
      (_) => fetchCartItems(),
    );
  }
}
