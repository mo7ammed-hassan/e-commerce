import 'package:t_store/features/personalization/pages/address/data/models/address_model.dart';

class AddressEntity {
  final String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String city;
  final String state;
  final String country;
  final String postalCode;
  final DateTime? createdAt;
  bool selectedAddress;

  AddressEntity({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
    required this.createdAt,
    required this.selectedAddress,
  });

  AddressEntity.empty()
      : id = '',
        name = '',
        phoneNumber = '',
        street = '',
        city = '',
        state = '',
        country = '',
        postalCode = '',
        createdAt = null,
        selectedAddress = false;

  AddressModel toModel() => AddressModel.fromEntity(this);
}
