import 'package:flutter/material.dart';
import 'package:ousa_app/common/widgets/products/cart/add_remove_button.dart';
import 'package:ousa_app/common/widgets/products/cart/cart_item.dart';
import 'package:ousa_app/common/widgets/products/product_card/TProduct_price_text.dart';
import 'package:ousa_app/utils/constants/size.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButton = true,
  });
  final bool showAddRemoveButton;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 2,
      shrinkWrap: true,
      separatorBuilder: (_, __) =>
          const SizedBox(height: TSizes.spaceBtwSections),
      itemBuilder: (_, indext) => Column(
        children: [
          const TCartItem(),
          if (showAddRemoveButton) const SizedBox(height: TSizes.spaceBtwItems),
          // Add Remove button Row with total Price
          if (showAddRemoveButton)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //  Add Remove Button
                Row(
                  children: [
                    // Extra Space
                    SizedBox(width: 70),
                    // Add Remove Button
                    TProductQuatityWithAddRemoveButton(),
                  ],
                ),
                // -- Product total Price
                TProductPriceText(price: '256')
              ],
            )
        ],
      ),
    );
  }
}
