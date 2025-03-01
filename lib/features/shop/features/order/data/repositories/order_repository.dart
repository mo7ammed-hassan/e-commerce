import 'package:dartz/dartz.dart';
import 'package:t_store/features/shop/features/order/data/models/order_model.dart';
import 'package:t_store/features/shop/features/order/data/source/order_firebase_service.dart';
import 'package:t_store/features/shop/features/order/domain/repositories/order_repository.dart';

class OrderRepositoryImpl extends OrderRepository {
  final OrderFirebaseService orderFirebaseService;
  OrderRepositoryImpl(this.orderFirebaseService);
  @override
  Future<Either<String, List<OrderModel>>> getAllOrders() async {
    return await orderFirebaseService.getAllOrders();
  }

  @override
  Future<Either<String, void>> placeOrder() async {
    return await orderFirebaseService.placeOrder();
  }
}
