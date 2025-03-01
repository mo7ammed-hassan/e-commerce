import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:t_store/common/core/firebase_collections/collections.dart';
import 'package:t_store/features/shop/features/order/data/models/order_model.dart';

abstract class OrderFirebaseService {
  Future<Either<String, void>> placeOrder();
  Future<Either<String, List<OrderModel>>> getAllOrders();
}

class OrderFirebaseServiceImpl implements OrderFirebaseService {
  final _userId = FirebaseAuth.instance.currentUser!.uid;
  final _storage = FirebaseFirestore.instance;
  @override
  Future<Either<String, List<OrderModel>>> getAllOrders() async {
    try {
      var data = await _storage
          .collection(FirebaseCollections.USER_COLLECTION)
          .doc(_userId)
          .collection(FirebaseCollections.ORDERS_COLLECTION)
          .get();

      List<OrderModel> orders =
          data.docs.map((doc) => OrderModel.fromJson(doc.data())).toList();
      return Right(orders);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> placeOrder() async {
    try {
      await _storage
          .collection(FirebaseCollections.USER_COLLECTION)
          .doc(_userId)
          .collection(FirebaseCollections.ORDERS_COLLECTION)
          .add({});
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
