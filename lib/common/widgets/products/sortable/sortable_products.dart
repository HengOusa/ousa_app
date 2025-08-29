import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ousa_app/common/widgets/layouts/grid_layout.dart';
import 'package:ousa_app/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:ousa_app/features/shop/controllers/product/all_products_controller.dart';
import 'package:ousa_app/features/shop/models/product_model.dart';
import 'package:ousa_app/utils/constants/size.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key, required this.products,
  });
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    // Initialize controller for managing products sorting
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        // -- Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
          // Sort products based on the selected options
          controller.sortProducts(value!);
          },
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ]
              .map((option) => DropdownMenuItem(
                    value: option,
                    child: Text(option),
                  ))
              .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        // Product
        Obx(
          ()=> TGridLayout(
              itemCount: controller.products.length,
              itemBuilder: (_, index) =>  TProductCardVertical(product: controller.products[index],)),
        )
      ],
    );
  }
}
