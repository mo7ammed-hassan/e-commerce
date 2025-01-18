import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/features/personalization/pages/address/domain/entities/address_entity.dart';

class AddressModel {
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

  AddressModel({
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

  AddressModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        phoneNumber = json['phoneNumber'],
        street = json['street'],
        city = json['city'],
        state = json['state'],
        country = json['country'],
        zipCode = json['zipCode'],
        createdAt = json['createdAt'],
        selectedAddress = json['selectedAddress'];

  // factory constructor to create a AddressModel from a DocumentSnapshot
  AddressModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : this.fromJson(snapshot.data()!);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phoneNumber': phoneNumber,
        'street': street,
        'city': city,
        'state': state,
        'country': country,
        'zipCode': zipCode,
        'createdAt': DateTime.now(),
        'selectedAddress': selectedAddress,
      };

  AddressModel.empty()
      : id = '1',
        name = 'test',
        phoneNumber = '010',
        street = 'test',
        city = 'test',
        state = 'test',
        country = 'test',
        zipCode = '256',
        createdAt = DateTime.now(),
        selectedAddress = false;
}

extension AddressXModel on AddressModel {
  AddressEntity toEntity() {
    return AddressEntity(
      id: id,
      name: name,
      phoneNumber: phoneNumber,
      street: street,
      city: city,
      state: state,
      country: country,
      zipCode: zipCode,
      createdAt: createdAt,
      selectedAddress: selectedAddress,
    );
  }
}
