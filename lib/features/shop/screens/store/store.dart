import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ousa_app/common/appbar/appbar.dart';
import 'package:ousa_app/common/appbar/tabbar.dart';
import 'package:ousa_app/common/custom_shapes/containers/search_container.dart';
import 'package:ousa_app/common/widgets/brands/brand_cart.dart';
import 'package:ousa_app/common/widgets/layouts/grid_layout.dart';
import 'package:ousa_app/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:ousa_app/common/widgets/texts/section_heading.dart';
import 'package:ousa_app/features/shop/controllers/category_controller.dart';
import 'package:ousa_app/features/shop/controllers/product/product_controller.dart';

import 'package:ousa_app/features/shop/screens/brands/all_brands.dart';
import 'package:ousa_app/features/shop/screens/store/widgets/category_tab.dart';
import 'package:ousa_app/utils/constants/colors.dart';
import 'package:ousa_app/utils/constants/size.dart';
import 'package:ousa_app/utils/helpers/helper_fucntions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    final controller = Get.put(ProductController());

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCartCounterIcon(
              onPressed: () {},
              iconColor: TColors.white,
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      // Search bar
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TSearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),
                      // Feartured brands
                      TSectionHeading(
                          title: 'Feartured Brand',
                          onPressed: () =>
                              Get.to(() => const AllBrandsScreen())),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      // ---- Icon

                      TGridLayout(
                        itemCount: 2,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return const TBranCart(showBorder: true);
                        },
                      )
                    ],
                  ),
                ),
                // Tab
                bottom: TTapBar(
                    tabs: categories
                        .map((category) => Tab(
                              child: Text(category.name),
                            ))
                        .toList()),
              )
            ];
          },
          // Body
          body: TabBarView(
              children: categories
                  .map((categoy) => TCategoryTab(category: categoy))
                  .toList()),
        ),
      ),
    );
  }
}
