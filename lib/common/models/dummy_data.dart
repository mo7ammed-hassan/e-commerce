import 'package:t_store/features/personalization/data/models/products/product_attribute_upload_model.dart';
import 'package:t_store/features/personalization/data/models/products/product_upload_model.dart';
import 'package:t_store/features/personalization/data/models/products/product_variation_upload_model.dart';
import 'package:t_store/features/shop/features/all_brands/data/brand_model.dart';
import 'package:t_store/features/shop/features/home/data/models/banner_model.dart';
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

  static final List<ProductUploadModel> products = [
    ProductUploadModel(
      stock: 20,
      id: '001',
      price: 135,
      title: 'Green Nike sports shoe',
      sku: 'ABR4568',
      salePrice: 30,
      description: 'This is a Product description for Green Nike sport shoe',
      categoryId: '1',
      productType: 'ProductType.value',
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
        ProductAttributeUploadModel(
          name: 'Color',
          values: ['Green', 'Black', 'Red'],
        ),
        ProductAttributeUploadModel(
          name: 'Size',
          values: ['EU 30', 'EU 32', 'EU 34'],
        ),
      ],
      productVariations: [
        ProductVariationUploadModel(
            id: '1',
            image: TImages.productImage1,
            price: 134,
            salePrice: 122.6,
            stock: 34,
            attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
            description:
                'This is a Product description for Green Nike sport shoe'),
        ProductVariationUploadModel(
          id: '2',
          image: TImages.productImage23,
          price: 132,
          stock: 15,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
          description:
              'This is a Product description for Green Nike sport shoe',
        ),
        ProductVariationUploadModel(
          id: '3',
          image: TImages.productImage23,
          price: 234,
          stock: 0,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
      ],
    ),
    ProductUploadModel(
      stock: 0,
      id: '002',
      price: 150, // New price
      title: 'Nike Air Max Running Shoes', // New name
      sku: 'AMX1234', // Updated SKU
      salePrice: 120,
      description: 'Nike Air Max for running, comfortable and durable.',
      categoryId: '1',
      productType: 'ProductType.value',
      images: [
        TImages.productImage60,
        TImages.productImage62,
        TImages.productImage63
      ],
      thumbnail: TImages.productImage2,
      isFeatured: true,
      brand: BrandModel(
        id: '6',
        name: 'Nike',
        image: TImages.nikeLogo,
        isFeatured: true,
        productCount: 2,
      ),
      productAttributes: [
        ProductAttributeUploadModel(
          name: 'Color',
          values: ['White', 'Blue', 'Red'],
        ),
        ProductAttributeUploadModel(
          name: 'Size',
          values: ['EU 40', 'EU 42', 'EU 44'],
        ),
      ],
      productVariations: [
        ProductVariationUploadModel(
          id: '1',
          image: TImages.productImage1,
          price: 145,
          salePrice: 120,
          stock: 50,
          attributeValues: {'Color': 'White', 'Size': 'EU 40'},
          description: 'Nike Air Max White for running.',
        ),
        ProductVariationUploadModel(
          id: '2',
          image: TImages.productImage23,
          price: 145,
          stock: 30,
          attributeValues: {'Color': 'Blue', 'Size': 'EU 42'},
          description: 'Nike Air Max Blue for running.',
        ),
      ],
    ),
    ProductUploadModel(
      stock: 20,
      id: '003',
      price: 180, // Updated price
      title: 'Nike Free 5.0', // Updated name
      sku: 'FR5001', // Updated SKU
      salePrice: 150,
      description: 'The Nike Free 5.0 offers freedom and flexibility.',
      categoryId: '1',
      productType: 'ProductType.signle',
      images: [
        TImages.productImage60,
        TImages.productImage62,
        TImages.productImage63
      ],
      thumbnail: TImages.productImage3,
      isFeatured: true,
      brand: BrandModel(
        id: '6',
        name: 'Nike',
        image: TImages.nikeLogo,
        isFeatured: true,
        productCount: 3,
      ),
      productAttributes: [
        ProductAttributeUploadModel(
          name: 'Color',
          values: ['Grey', 'Black'],
        ),
        ProductAttributeUploadModel(
          name: 'Size',
          values: ['EU 41', 'EU 43', 'EU 45'],
        ),
      ],
      productVariations: [
        ProductVariationUploadModel(
          id: '1',
          image: TImages.productImage1,
          price: 170,
          salePrice: 150,
          stock: 25,
          attributeValues: {'Color': 'Grey', 'Size': 'EU 41'},
          description: 'Nike Free 5.0 Grey for athletes.',
        ),
        ProductVariationUploadModel(
          id: '2',
          image: TImages.productImage23,
          price: 170,
          stock: 40,
          attributeValues: {'Color': 'Black', 'Size': 'EU 43'},
          description: 'Nike Free 5.0 Black for flexibility.',
        ),
      ],
    ),
    ProductUploadModel(
      stock: 20,
      id: '004',
      price: 200, // Updated price
      title: 'Nike Air Zoom Pegasus 38', // Updated name
      sku: 'AZP3801', // Updated SKU
      salePrice: 180,
      description: 'Nike Air Zoom for high-performance running.',
      categoryId: '1',
      productType: 'ProductType.value',
      images: [
        TImages.productImage60,
        TImages.productImage62,
        TImages.productImage63
      ],
      thumbnail: TImages.productImage4,
      isFeatured: true,
      brand: BrandModel(
        id: '6',
        name: 'Nike',
        image: TImages.nikeLogo,
        isFeatured: true,
        productCount: 5,
      ),
      productAttributes: [
        ProductAttributeUploadModel(
          name: 'Color',
          values: ['Red', 'Blue'],
        ),
        ProductAttributeUploadModel(
          name: 'Size',
          values: ['EU 39', 'EU 41'],
        ),
      ],
      productVariations: [
        ProductVariationUploadModel(
          id: '1',
          image: TImages.productImage1,
          price: 190,
          salePrice: 180,
          stock: 30,
          attributeValues: {'Color': 'Red', 'Size': 'EU 39'},
          description: 'Nike Air Zoom Red for high-performance.',
        ),
        ProductVariationUploadModel(
          id: '2',
          image: TImages.productImage23,
          price: 190,
          stock: 20,
          attributeValues: {'Color': 'Blue', 'Size': 'EU 41'},
          description: 'Nike Air Zoom Blue for maximum speed.',
        ),
      ],
    ),
    ProductUploadModel(
      stock: 20,
      id: '005',
      price: 120, // Updated price
      title: 'Nike Zoom Winflo 8', // Updated name
      sku: 'ZW8001', // Updated SKU
      salePrice: 100,
      description: 'Nike Zoom for casual runners and athletes.',
      categoryId: '1',
      productType: 'ProductType.value',
      images: [
        TImages.productImage60,
        TImages.productImage62,
        TImages.productImage63
      ],
      thumbnail: TImages.productImage5,
      isFeatured: true,
      brand: BrandModel(
        id: '6',
        name: 'Nike',
        image: TImages.nikeLogo,
        isFeatured: true,
        productCount: 3,
      ),
      productAttributes: [
        ProductAttributeUploadModel(
          name: 'Color',
          values: ['Black', 'Blue'],
        ),
        ProductAttributeUploadModel(
          name: 'Size',
          values: ['EU 36', 'EU 38', 'EU 40'],
        ),
      ],
      productVariations: [
        ProductVariationUploadModel(
          id: '1',
          image: TImages.productImage1,
          price: 115,
          salePrice: 100,
          stock: 20,
          attributeValues: {'Color': 'Black', 'Size': 'EU 36'},
          description: 'Nike Zoom Winflo Black for casual running.',
        ),
        ProductVariationUploadModel(
          id: '2',
          image: TImages.productImage23,
          price: 115,
          stock: 25,
          attributeValues: {'Color': 'Blue', 'Size': 'EU 38'},
          description: 'Nike Zoom Winflo Blue for running.',
        ),
      ],
    ),
    ProductUploadModel(
      stock: 20,
      id: '006',
      price: 130, // Updated price
      title: 'Nike ZoomX Vaporfly Next%', // Updated name
      sku: 'VNX1201', // Updated SKU
      salePrice: 120,
      description: 'Nike ZoomX Vaporfly for professional runners.',
      categoryId: '1',
      productType: 'ProductType.value',
      images: [
        TImages.productImage60,
        TImages.productImage62,
        TImages.productImage63
      ],
      thumbnail: TImages.productImage6,
      isFeatured: true,
      brand: BrandModel(
        id: '6',
        name: 'Nike',
        image: TImages.nikeLogo,
        isFeatured: true,
        productCount: 4,
      ),
      productAttributes: [
        ProductAttributeUploadModel(
          name: 'Color',
          values: ['Yellow', 'Black'],
        ),
        ProductAttributeUploadModel(
          name: 'Size',
          values: ['EU 42', 'EU 44'],
        ),
      ],
      productVariations: [
        ProductVariationUploadModel(
          id: '1',
          image: TImages.productImage1,
          price: 125,
          salePrice: 120,
          stock: 10,
          attributeValues: {'Color': 'Yellow', 'Size': 'EU 42'},
          description: 'Nike ZoomX Yellow for speed.',
        ),
        ProductVariationUploadModel(
          id: '2',
          image: TImages.productImage23,
          price: 125,
          stock: 30,
          attributeValues: {'Color': 'Black', 'Size': 'EU 44'},
          description: 'Nike ZoomX Black for performance.',
        ),
      ],
    ),
  ];
}
