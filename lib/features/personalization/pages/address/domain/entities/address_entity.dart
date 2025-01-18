class AddressEntity {
  final String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String city;
  final String state;
  final String country;
  final String zipCode;
  final DateTime? createdAt;
  final bool selectedAddress;

  AddressEntity({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.zipCode,
    required this.createdAt,
    required this.selectedAddress,
  });

  // Empty constructor for Firestore
  AddressEntity.empty()
      : id = '',
        name = '',
        phoneNumber = '',
        street = '',
        city = '',
        state = '',
        country = '',
        zipCode = '',
        createdAt = null,
        selectedAddress = false;
}
