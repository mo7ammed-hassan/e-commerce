import 'package:t_store/features/shop/features/home/data/models/category_model.dart';
import 'package:t_store/utils/constants/images_strings.dart';

class DummyData {
  // List of all categories
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', name: 'Sports', image: TImages.sportIcon, isFeatured: true),
    CategoryModel(
        id: '5',
        name: 'Furniture',
        image: TImages.furnitureIcon,
        isFeatured: true),
    CategoryModel(
        id: '2',
        name: 'Electronics',
        image: TImages.electronicsIcon,
        isFeatured: true),
    CategoryModel(
        id: '3', name: 'Clothing', image: TImages.clothIcon, isFeatured: true),
    CategoryModel(
        id: '4', name: 'Animals', image: TImages.animalIcon, isFeatured: true),
    CategoryModel(
        id: '6', name: 'Shoes', image: TImages.shoeIcon, isFeatured: true),
    CategoryModel(
        id: '7',
        name: 'Cosmetics',
        image: TImages.cosmeticsIcon,
        isFeatured: true),
    CategoryModel(
        id: '14',
        name: 'Jewelery',
        image: TImages.jeweleryIcon,
        isFeatured: true),

    //subCategories
    CategoryModel(
        id: '8',
        name: 'Sport Shoes',
        parentId: '1',
        image: TImages.cosmeticsIcon,
        isFeatured: false),
    CategoryModel(
        id: '9',
        name: 'Track suits',
        parentId: '1',
        image: TImages.cosmeticsIcon,
        isFeatured: false),
    CategoryModel(
        id: '10',
        name: 'Sports Equipments',
        parentId: '1',
        image: TImages.cosmeticsIcon,
        isFeatured: false),

    //Furniture
    CategoryModel(
        id: '11',
        name: 'Kitchen Furniture',
        parentId: '5',
        image: TImages.furnitureIcon,
        isFeatured: false),
    CategoryModel(
        id: '12',
        name: 'Bedroom Furniture',
        parentId: '5',
        image: TImages.furnitureIcon,
        isFeatured: false),
    CategoryModel(
        id: '13',
        name: 'Office Furniture',
        parentId: '5',
        image: TImages.furnitureIcon,
        isFeatured: false),
    
   // electornics 
    CategoryModel(
        id: '14',
        name: 'Mobiles',
        parentId: '2',
        image: TImages.electronicsIcon,
        isFeatured: false),
    CategoryModel(
        id: '15',
        name: 'Laptops',
        parentId: '2',
        image: TImages.electronicsIcon,
        isFeatured: false),

        
   CategoryModel(
        id: '16',
        name: 'Shirts',
        parentId: '3',
        image: TImages.electronicsIcon,
        isFeatured: false),
  ];
}
