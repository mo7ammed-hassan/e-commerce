class CategoryEntity {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;
  
  CategoryEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.parentId,
    required this.isFeatured,
  });
}
