import 'package:hive/hive.dart';

part 'wishlist_model.g.dart';

@HiveType(typeId: 1) // Ensure the typeId is unique across your app
class WishlistModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final DateTime createdDate;

  WishlistModel({required this.id, required this.createdDate});
}
