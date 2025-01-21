import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/shop/features/cart/presentation/cubits/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitialState());
   
   
}
