import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ousa_app/common/widgets/texts/section_heading.dart';
import 'package:ousa_app/features/shop/models/product_model.dart';
import 'package:ousa_app/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:ousa_app/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:ousa_app/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:ousa_app/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ousa_app/features/shop/screens/product_details/widgets/rating-share_widget.dart';
import 'package:ousa_app/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:ousa_app/utils/constants/colors.dart';
import 'package:ousa_app/utils/constants/enums.dart';
import 'package:ousa_app/utils/constants/size.dart';
import 'package:ousa_app/utils/helpers/helper_fucntions.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1 - Product Image Image Slider
             TProductImageSlider(product: product),

            // 2 - Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  // --1 Rating & Share Button
                  const TRatingAndShare(),

                  // -- Price , Title , Stock , & Brand
                  TProductMetaData(product: product,),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  // --- Attribute

                 if(product.productType == ProductType.variable.toString())  TProductAttributes(product: product,),
                 if(product.productType == ProductType.variable.toString()) const SizedBox(height: TSizes.spaceBtwSections),
                  //-- Checkout Button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Checkout'))),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // -- Description
                  const TSectionHeading(
                      title: 'Description', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwSections),
                   ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: ' less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  // -- Review
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(
                        title: 'Review (199)',
                        showActionButton: false,
                      ),
                      IconButton(
                        icon: Icon(
                          Iconsax.arrow_right_3,
                          color: dark ? TColors.white : TColors.black,
                        ),
                        // style: TextStyle(color),
                        onPressed: () =>
                            Get.to(() => const ProductReviewsScreen()),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
