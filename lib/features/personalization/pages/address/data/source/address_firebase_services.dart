import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:t_store/common/core/firebase_collections/collections.dart';
import 'package:t_store/features/personalization/pages/address/data/models/address_model.dart';

abstract class AddressFirebaseServices {
  Future<Either> fetchAddresses();
  Future<Either> addNewAddress({required AddressModel address});
  Future<void> deleteAddress({required String addressId});
  Future<void> updateSelectedAddress(
      {required String addressId, required bool isSelected});
}

class AddressFirebaseServicesImpl extends AddressFirebaseServices {
  final _storage = FirebaseFirestore.instance;
  final _user = FirebaseAuth.instance.currentUser;

  @override
  Future<Either<String, String>> addNewAddress(
      {required AddressModel address}) async {
    try {
      final userId = _user!.uid;

      var collection = _storage
          .collection(FirebaseCollections.USER_COLLECTION)
          .doc(userId)
          .collection(FirebaseCollections.ADDRESS_COLLECTION);

      final currentAddress = await collection.add(address.toJson());

      return Right(currentAddress.id);
    } on Exception catch (e) {
      return Left('Error adding address: $e');
    }
  }

  @override
  Future<void> deleteAddress({required String addressId}) async {
    try {
      final userId = _user!.uid;

      await _storage
          .collection(FirebaseCollections.USER_COLLECTION)
          .doc(userId)
          .collection(FirebaseCollections.ADDRESS_COLLECTION)
          .doc(addressId)
          .delete();
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<Either> fetchAddresses() async {
    try {
      final userId = _user!.uid;

      var collection = _storage
          .collection(FirebaseCollections.USER_COLLECTION)
          .doc(userId)
          .collection(FirebaseCollections.ADDRESS_COLLECTION);

      var data = await collection.get();

      return Right(data.docs);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<void> updateSelectedAddress(
      {required String addressId, required bool isSelected}) async {
    try {
      final userId = _user!.uid;
      
      await _storage
          .collection(FirebaseCollections.USER_COLLECTION)
          .doc(userId)
          .collection(FirebaseCollections.ADDRESS_COLLECTION)
          .doc(addressId)
          .update({'selectedAddress': isSelected});
    } catch (e) {
      throw e.toString();
    }
  }
}
