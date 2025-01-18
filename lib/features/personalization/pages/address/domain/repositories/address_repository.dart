import 'package:dartz/dartz.dart';
import 'package:t_store/features/personalization/pages/address/data/models/address_model.dart';

abstract class AddressRepository {
  Future<Either> fetchAllAddresses();
  Future<Either> addNewAddress({required AddressModel address});
  Future<void> deleteAddress({required String addressId});
  Future<void> updateSelectedAddress(
      {required String addressId,required bool isSelected});
}
