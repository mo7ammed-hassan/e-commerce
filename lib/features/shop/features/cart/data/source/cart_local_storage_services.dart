import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:t_store/features/shop/features/cart/data/models/cart_item_model.dart';

abstract class CartLocalStorageServices {
  // -- Store items in cart--
  void storeCartItems({required List<CartItemModel> cartItems});
  // -- Fetch items from cart--
  Future<List<CartItemModel>> fetchCartItems({required String box});
}

class CartLocalStorageServicesImpl implements CartLocalStorageServices {
  static final String _userId = FirebaseAuth.instance.currentUser!.uid;
  static final String _boxName = '${_userId}Cart';
  @override
  Future<List<CartItemModel>> fetchCartItems({required String box}) async {
    var cartBox = await Hive.openBox<String>(_boxName);
    final jsonString = cartBox.get('cartItems', defaultValue: '[]');
    final List<dynamic> decodedJson = jsonDecode(jsonString!);

    return decodedJson.map((item) => CartItemModel.fromJson(item)).toList();
  }

  @override
  void storeCartItems({required List<CartItemModel> cartItems}) async {
    final cartBox = await Hive.openBox<String>(_boxName);
    final jsonString =
        jsonEncode(cartItems.map((item) => item.toJson()).toList());
    await cartBox.put('cartItems', jsonString);
  }
}
