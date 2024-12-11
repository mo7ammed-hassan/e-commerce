import 'package:t_store/features/shop/features/all_brands/data/brand_model.dart';
import 'package:t_store/features/shop/features/home/data/models/banner_model.dart';
import 'package:t_store/features/shop/features/home/data/models/category_model.dart';
import 'package:t_store/features/shop/features/home/data/models/product_attribute_model.dart';
import 'package:t_store/features/shop/features/home/data/models/product_model.dart';
import 'package:t_store/features/shop/features/home/data/models/product_variation_model.dart';
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

  static final List<BannerModel> banners = [
    BannerModel(
        id: '1', image: TImages.banner1, targetScreen: '/order', active: false),
    BannerModel(
        id: '2', image: TImages.banner2, targetScreen: '/cart', active: false),
    BannerModel(
        image: TImages.banner3, targetScreen: '/favorite', active: true),
    BannerModel(image: TImages.banner4, targetScreen: '/search', active: true),
    BannerModel(
        image: TImages.banner5, targetScreen: '/settings', active: true),
    BannerModel(
        image: TImages.banner6, targetScreen: '/userAddress', active: true),
    BannerModel(
        image: TImages.banner8, targetScreen: '/checout', active: false),
  ];

  static final List<ProductModel> products = [
    ProductModel(
      id: '001',
      price: 135,
      title: 'Green Nike sports shoe',
      sku: 'ABR4568',
      salePrice: 30,
      description: 'This is a Product description for Green Nike sport shoe',
      categoryId: '1',
      productType: 'ProductVariable.value',
      images: [
        TImages.productImage60,
        TImages.productImage62,
        TImages.productImage63
      ],
      thumbnail: TImages.productImage1,
      isFeatured: true,
      brand: BrandModel(
        id: '6',
        name: 'Nike',
        image: TImages.nikeLogo,
        isFeatured: true,
        productCount: 2,
      ),
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Green', 'Black', 'Red'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['EU 30', 'EU 32', 'EU 34'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            image: TImages.productImage1,
            price: 134,
            salePrice: 122.6,
            stock: 34,
            attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
            description:
                'This is a Product description for Green Nike sport shoe'),
        ProductVariationModel(
          id: '2',
          image: TImages.productImage23,
          price: 132,
          stock: 15,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
          description:
              'This is a Product description for Green Nike sport shoe',
        ),
        ProductVariationModel(
          id: '3',
          image: TImages.productImage23,
          price: 234,
          stock: 0,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
      ],
    ),
    ProductModel(
      id: '002',
      price: 135,
      title: 'Green Nike sports shoe',
      sku: 'ABR4568',
      salePrice: 30,
      productType: 'ProductVariable.value',
      description: 'This is a Product description for Green Nike sport shoe',
      categoryId: '1',
      images: [
        TImages.productImage60,
        TImages.productImage62,
        TImages.productImage63
      ],
      thumbnail: TImages.productImage1,
      isFeatured: true,
      brand: BrandModel(
        id: '6',
        name: 'Nike',
        image: TImages.nikeLogo,
        isFeatured: true,
        productCount: 2,
      ),
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Green', 'Black', 'Red'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['EU 30', 'EU 32', 'EU 34'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            image: TImages.productImage1,
            price: 134,
            salePrice: 122.6,
            stock: 34,
            attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
            description:
                'This is a Product description for Green Nike sport shoe'),
        ProductVariationModel(
          id: '2',
          image: TImages.productImage23,
          price: 132,
          stock: 15,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
          description:
              'This is a Product description for Green Nike sport shoe',
        ),
        ProductVariationModel(
          id: '3',
          image: TImages.productImage23,
          price: 234,
          stock: 0,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
      ],
    ),
    ProductModel(
      id: '003',
      price: 135,
      productType: 'ProductVariable.value',
      title: 'Green Nike sports shoe',
      sku: 'ABR4568',
      salePrice: 30,
      description: 'This is a Product description for Green Nike sport shoe',
      categoryId: '1',
      images: [
        TImages.productImage60,
        TImages.productImage62,
        TImages.productImage63
      ],
      thumbnail: TImages.productImage1,
      isFeatured: true,
      brand: BrandModel(
        id: '6',
        name: 'Nike',
        image: TImages.nikeLogo,
        isFeatured: true,
        productCount: 2,
      ),
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Green', 'Black', 'Red'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['EU 30', 'EU 32', 'EU 34'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            image: TImages.productImage1,
            price: 134,
            salePrice: 122.6,
            stock: 34,
            attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
            description:
                'This is a Product description for Green Nike sport shoe'),
        ProductVariationModel(
          id: '2',
          image: TImages.productImage23,
          price: 132,
          stock: 15,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
          description:
              'This is a Product description for Green Nike sport shoe',
        ),
        ProductVariationModel(
          id: '3',
          image: TImages.productImage23,
          price: 234,
          stock: 0,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
      ],
    ),
    ProductModel(
      id: '004',
      price: 135,
      title: 'Green Nike sports shoe',
      sku: 'ABR4568',
      productType: 'ProductVariable.value',
      salePrice: 30,
      description: 'This is a Product description for Green Nike sport shoe',
      categoryId: '1',
      images: [
        TImages.productImage60,
        TImages.productImage62,
        TImages.productImage63
      ],
      thumbnail: TImages.productImage1,
      isFeatured: true,
      brand: BrandModel(
        id: '6',
        name: 'Nike',
        image: TImages.nikeLogo,
        isFeatured: true,
        productCount: 2,
      ),
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Green', 'Black', 'Red'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['EU 30', 'EU 32', 'EU 34'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            image: TImages.productImage1,
            price: 134,
            salePrice: 122.6,
            stock: 34,
            attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
            description:
                'This is a Product description for Green Nike sport shoe'),
        ProductVariationModel(
          id: '2',
          image: TImages.productImage23,
          price: 132,
          stock: 15,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
          description:
              'This is a Product description for Green Nike sport shoe',
        ),
        ProductVariationModel(
          id: '3',
          image: TImages.productImage23,
          price: 234,
          stock: 0,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
      ],
    ),
    ProductModel(
      id: '005',
      price: 135,
      title: 'Green Nike sports shoe',
      productType: 'ProductVariable.value',
      sku: 'ABR4568',
      salePrice: 30,
      description: 'This is a Product description for Green Nike sport shoe',
      categoryId: '1',
      images: [
        TImages.productImage60,
        TImages.productImage62,
        TImages.productImage63
      ],
      thumbnail: TImages.productImage1,
      isFeatured: true,
      brand: BrandModel(
        id: '6',
        name: 'Nike',
        image: TImages.nikeLogo,
        isFeatured: true,
        productCount: 2,
      ),
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Green', 'Black', 'Red'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['EU 30', 'EU 32', 'EU 34'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            image: TImages.productImage1,
            price: 134,
            salePrice: 122.6,
            stock: 34,
            attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
            description:
                'This is a Product description for Green Nike sport shoe'),
        ProductVariationModel(
          id: '2',
          image: TImages.productImage23,
          price: 132,
          stock: 15,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
          description:
              'This is a Product description for Green Nike sport shoe',
        ),
        ProductVariationModel(
          id: '3',
          image: TImages.productImage23,
          price: 234,
          stock: 0,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
      ],
    ),
    ProductModel(
      id: '006',
      price: 135,
      title: 'Green Nike sports shoe',
      sku: 'ABR4568',
      salePrice: 30,
      description: 'This is a Product description for Green Nike sport shoe',
      productType: 'ProductVariable.value',
      categoryId: '1',
      images: [
        TImages.productImage60,
        TImages.productImage62,
        TImages.productImage63
      ],
      thumbnail: TImages.productImage1,
      isFeatured: true,
      brand: BrandModel(
        id: '6',
        name: 'Nike',
        image: TImages.nikeLogo,
        isFeatured: true,
        productCount: 2,
      ),
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Green', 'Black', 'Red'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['EU 30', 'EU 32', 'EU 34'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            image: TImages.productImage1,
            price: 134,
            salePrice: 122.6,
            stock: 34,
            attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
            description:
                'This is a Product description for Green Nike sport shoe'),
        ProductVariationModel(
          id: '2',
          image: TImages.productImage23,
          price: 132,
          stock: 15,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
          description:
              'This is a Product description for Green Nike sport shoe',
        ),
        ProductVariationModel(
          id: '3',
          image: TImages.productImage23,
          price: 234,
          stock: 0,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
      ],
    ),
  ];
}
