import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class ProductFirebaseServices {
  Future<Either<dynamic, List<DocumentSnapshot<Map<String, dynamic>>>>>
      getProducts();
}

class ProductFirebaseServicesImpl implements ProductFirebaseServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Either<dynamic, List<DocumentSnapshot<Map<String, dynamic>>>>>
      getProducts() async {
    // TODO: implement getProducts
    throw UnimplementedError();
  }
}
