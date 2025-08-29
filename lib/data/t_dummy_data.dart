import 'package:ousa_app/features/shop/models/banner_model.dart';
import 'package:ousa_app/features/shop/models/brand_model.dart';
import 'package:ousa_app/features/shop/models/product_attribute_model.dart';
import 'package:ousa_app/features/shop/models/product_model.dart';
import 'package:ousa_app/features/shop/models/product_variation_model.dart';
import 'package:ousa_app/routes/routes.dart';
import 'package:ousa_app/utils/constants/image_strings.dart';

class TDummyData {
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: TImages.promoBanner1,
        targetScreen: TRoutes.order,
        active: false),
    BannerModel(
        imageUrl: TImages.productImage2,
        targetScreen: TRoutes.cart,
        active: true),
    BannerModel(
        imageUrl: TImages.productImage3,
        targetScreen: TRoutes.cart,
        active: true),
  ];

  // -- List of all Products

  static final List<ProductModel> products = [
    ProductModel(
      id: '001',
      title: "Green Nike sports shoe",
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: TImages.productImage1,
      description: 'Green Nike sports shoe',
      brand: BrandModel(id: '1', name: 'Nike', image: TImages.lightAppLogo),
      images: [
        TImages.productImage1,
        TImages.productImage2,
        TImages.clothIcon,
        TImages.productImage3
      ],
      salePrice: 30,
      sku: 'ABR45689',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU34']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 133.2,
          image: TImages.productImage1,
          description:
              'This is a Product description for Green Nike sports shoe.',
          attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 14,
          price: 130,
          image: TImages.productImage2,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 0,
          price: 234,
          image: TImages.productImage3,
          attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '002',
      title: "Green Nike sports shoe",
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: TImages.productImage1,
      description: 'Green Nike sports shoe',
      brand: BrandModel(id: '1', name: 'Nike', image: TImages.lightAppLogo),
      images: [
        TImages.productImage1,
        TImages.productImage2,
        TImages.clothIcon,
        TImages.productImage3
      ],
      salePrice: 30,
      sku: 'ABR45689',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU34']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 133.2,
          image: TImages.productImage1,
          description:
              'This is a Product description for Green Nike sports shoe.',
          attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 14,
          price: 130,
          image: TImages.productImage2,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 0,
          price: 234,
          image: TImages.productImage3,
          attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
        ),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '003',
      title: "Green Nike sports shoe",
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: TImages.productImage1,
      description: 'Green Nike sports shoe',
      brand: BrandModel(id: '1', name: 'Nike', image: TImages.lightAppLogo),
      images: [
        TImages.productImage1,
        TImages.productImage2,
        TImages.clothIcon,
        TImages.productImage3
      ],
      salePrice: 30,
      sku: 'ABR45689',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU34']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 133.2,
          image: TImages.productImage1,
          description:
              'This is a Product description for Green Nike sports shoe.',
          attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 14,
          price: 130,
          image: TImages.productImage2,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 0,
          price: 234,
          image: TImages.productImage3,
          attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
        ),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '004',
      title: "4 Color collar T-Shirt dry fit",
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: TImages.productImage1,
      description: 'This is a Product description for 4 Color collar T-Shirt dry fit.There are more things that can be added but its just a demo and nothing else.',
      brand: BrandModel(id: '1', name: 'Nike', image: TImages.lightAppLogo),
      images: [
        TImages.productImage1,
        TImages.productImage2,
        TImages.clothIcon,
        TImages.productImage3
      ],
      salePrice: 30,
      sku: 'ABR45689',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Yellow', 'Green', 'Blue']),
        ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU34']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 133.2,
          image: TImages.productImage1,
          description:
              'This a Product description for 4 Colors collar T-Shirt dry fit.',
          attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 14,
          price: 130,
          image: TImages.productImage2,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 0,
          price: 234,
          image: TImages.productImage3,
          attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 0,
          price: 234,
          image: TImages.productImage3,
          attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 0,
          price: 234,
          image: TImages.productImage3,
          attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 0,
          price: 234,
          image: TImages.productImage3,
          attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '7',
          stock: 0,
          price: 234,
          image: TImages.productImage3,
          attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '8',
          stock: 0,
          price: 234,
          image: TImages.productImage3,
          attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '005',
      title: "4 Color collar T-Shirt dry fit",
      stock: 15,
      price: 135,
      isFeatured: false,
      thumbnail: TImages.productImage1,
      description: 'This is a Product description for 4 Color collar T-Shirt dry fit.There are more things that can be added but its just a demo and nothing else.',
      brand: BrandModel(id: '1', name: 'Nike', image: TImages.lightAppLogo),
      images: [
        TImages.productImage1,
        TImages.productImage2,
        TImages.clothIcon,
        TImages.productImage3
      ],
      salePrice: 30,
      sku: 'ABR45689',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Yellow', 'Green', 'Blue']),
        ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU34']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 133.2,
          image: TImages.productImage1,
          description:
              'This a Product description for 4 Colors collar T-Shirt dry fit.',
          attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 14,
          price: 130,
          image: TImages.productImage2,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 0,
          price: 234,
          image: TImages.productImage3,
          attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 0,
          price: 234,
          image: TImages.productImage3,
          attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 0,
          price: 234,
          image: TImages.productImage3,
          attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 0,
          price: 234,
          image: TImages.productImage3,
          attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
        ),
      ],
      productType: 'ProductType.single',
    ),
   
  ];
}
