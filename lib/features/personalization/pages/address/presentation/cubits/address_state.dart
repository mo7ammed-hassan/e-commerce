import 'package:t_store/features/personalization/pages/address/domain/entities/address_entity.dart';

abstract class AddressState {}

class AddressInitial extends AddressState {}

class FetchAddressesLoadingState extends AddressState {}

class FetchAddressesSuccessState extends AddressState {
  final List<AddressEntity> addresses;

  FetchAddressesSuccessState(this.addresses);
}

class FetchAddressesFailureState extends AddressState {}

// select Address

class SelectedAddressLoadingState extends AddressState {}

class SelectedAddressSuccessState extends AddressState {
   AddressEntity selectedAddress;

  SelectedAddressSuccessState(this.selectedAddress);
}

class SelectedAddressFailureState extends AddressState {
  final String message;

  SelectedAddressFailureState(this.message);
}

// Add Address

class AddAddressLoadingState extends AddressState {}

class AddAddressSuccessState extends AddressState {
  final String addressId;

  AddAddressSuccessState(this.addressId);
}

class AddAddressFailureState extends AddressState {}

// Delete Address

class DeleteAddressLoadingState extends AddressState {}

class DeleteAddressSuccessState extends AddressState {}

class DeleteAddressFailureState extends AddressState {}
