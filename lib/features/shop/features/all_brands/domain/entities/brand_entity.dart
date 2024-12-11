class BrandEntity {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productCount;

  BrandEntity({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productCount,
  });
}
