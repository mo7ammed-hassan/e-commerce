// ignore_for_file: public_member_api_docs, sort_constructors_first
class BannerModel {
  String imageUrl;
  String targetScreen;
  bool active;

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

  static BannerModel fromJson(Map<String, dynamic> json) => BannerModel(
        imageUrl: json['ImageUrl'],
        targetScreen: json['TargetScreen'],
        active: json['Active'] as bool,
      );
}
