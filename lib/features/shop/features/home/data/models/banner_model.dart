// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/features/shop/features/home/domain/entites/banner_entity.dart';

class BannerModel {
  String imageUrl;
  final String targetScreen;
  final bool active;

  BannerModel({
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
  });

  static BannerModel empty() =>
      BannerModel(imageUrl: '', targetScreen: '', active: false);

  Map<String, dynamic> toJson() => {
        'ImageUrl': imageUrl,
        'TargetScreen': targetScreen,
        'Active': active,
      };

  factory BannerModel.fromJson(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return BannerModel(
      imageUrl: data['ImageUrl'] ?? '',
      targetScreen: data['TargetScreen'] ?? '',
      active: data['Active'] ?? false,
    );
  }
}

extension BannerXModel on BannerModel {
  BannerEntity toEntity() {
    return BannerEntity(
      imageUrl: imageUrl,
      targetScreen: targetScreen,
      active: active,
    );
  }
}
