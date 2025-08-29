import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ousa_app/common/custom_shapes/containers/primary_header_container.dart';
import 'package:ousa_app/common/custom_shapes/containers/search_container.dart';
import 'package:ousa_app/common/widgets/layouts/grid_layout.dart';
import 'package:ousa_app/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:ousa_app/common/widgets/shimmers/TVerticalProductShimmer.dart';
import 'package:ousa_app/common/widgets/texts/section_heading.dart';
import 'package:ousa_app/features/shop/controllers/product/product_controller.dart';
import 'package:ousa_app/features/shop/screens/all_products/all_products.dart';
import 'package:ousa_app/features/shop/screens/widgets/home_appbar.dart';
import 'package:ousa_app/features/shop/screens/widgets/home_categories.dart';
import 'package:ousa_app/features/shop/screens/widgets/promo_slider.dart';
import 'package:ousa_app/utils/constants/size.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header -- Tutorial [Section # 3 ,Video # 2]
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // -- Appbar -- Tutorial [Section #3, Video # 3]
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  // -- Searchbar -- Tutorial [Section #3 ,Video # 4]

                  TSearchContainer(
                    text: 'Search in Store',
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),

                  // -- Categories -- Tutorial [Section # 3 , Video # 4]
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                        ),
                        SizedBox(height: TSizes.spaceBtwItems),
                        // categories

                        THomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(),
                  TSectionHeading(
                      title: 'Popular Products',
                      onPressed: () => Get.to(() => AllProducts(
                            title: 'Populart Products',
                            
                            futureMethod: controller.fetchAllFeaturedProducts(),
                          ))),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  Obx(() {
                    if (controller.isLoading.value)
                      return const Tverticalproductshimmer();
                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                        child: Text(
                          'No Data Found!',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    }
                    return TGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) => TProductCardVertical(
                          product: controller.featuredProducts[index]),
                    );
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
