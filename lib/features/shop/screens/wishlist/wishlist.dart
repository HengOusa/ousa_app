import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ousa_app/common/appbar/appbar.dart';
import 'package:ousa_app/common/widgets/icons/t_circular_icon.dart';
import 'package:ousa_app/common/widgets/layouts/grid_layout.dart';
import 'package:ousa_app/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:ousa_app/features/shop/controllers/product/product_controller.dart';
import 'package:ousa_app/features/shop/screens/home/home.dart';
import 'package:ousa_app/utils/constants/size.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());

    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TGridLayout(
                  itemCount: controller.featuredProducts.length,
                  itemBuilder: (_, index) =>  TProductCardVertical(product: controller.featuredProducts[index]))
            ],
          ),
        ),
      ),
    );
  }
}
