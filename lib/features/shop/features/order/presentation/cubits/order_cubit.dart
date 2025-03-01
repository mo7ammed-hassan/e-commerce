import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/shop/features/order/domain/repositories/order_repository.dart';
import 'package:t_store/features/shop/features/order/presentation/cubits/order_state.dart';
import 'package:t_store/service_locator.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  //-- Fetch Orders Once --
  void fetchOrders() async {
    if (state is OrderSuccessState) return;

    emit(OrderLoadingState());
    var result = await getIt.get<OrderRepository>().getAllOrders();
    result.fold(
      (failure) => emit(OrderFailureState(failure)),
      (orders) => emit(OrderSuccessState(orders)),
    );
  }

  //-- Refresh Orders --
  void refreshOrders() async {
    emit(OrderLoadingState());
    var result = await getIt.get<OrderRepository>().getAllOrders();
    result.fold(
      (failure) => emit(OrderFailureState(failure)),
      (orders) => emit(OrderSuccessState(orders)),
    );
  }
}
