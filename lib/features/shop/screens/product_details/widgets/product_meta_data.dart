import 'package:flutter/material.dart';
import 'package:ousa_app/common/widgets/images/t_circular_image.dart';
import 'package:ousa_app/common/widgets/products/product_card/TProduct_price_text.dart';
import 'package:ousa_app/common/widgets/products/product_card/TRoundedContainer.dart';
import 'package:ousa_app/common/widgets/texts/product_title_text.dart';
import 'package:ousa_app/common/widgets/texts/t_bran_title_text_with_verified_icon.dart';
import 'package:ousa_app/features/shop/controllers/product/product_controller.dart';
import 'package:ousa_app/features/shop/models/product_model.dart';
import 'package:ousa_app/utils/constants/colors.dart';
import 'package:ousa_app/utils/constants/enums.dart';
import 'package:ousa_app/utils/constants/image_strings.dart';
import 'package:ousa_app/utils/constants/size.dart';
import 'package:ousa_app/utils/helpers/helper_fucntions.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price & sale Price
        Row(
          children: [
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text('$salePercentage%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.black)),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),

            // Price
            if(product.productType == ProductType.single.toString() && product.salePrice > 0)
            Text(
              '\$${product.price}',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            if(product.productType == ProductType.single.toString() && product.salePrice > 0)
            const SizedBox(width: TSizes.spaceBtwItems),
             TProductPriceText(price: controller.getProductPrice(product), isLarge: true)
          ],
        ),
        const SizedBox(width: TSizes.spaceBtwItems / 1.5),

        // Title

        TProductTitleText(title: product.title),
        const SizedBox(width: TSizes.spaceBtwItems / 1.5),

        // Stock Status
        Row(
          children: [
            const TProductTitleText(title: 'Status'),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(
              controller.getProductStockStatus(product.stock),
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
        const SizedBox(width: TSizes.spaceBtwItems / 1.5),

        // Brand
        Row(
          children: [
            TCircularImage(
              image: product.brand != null ? product.brand!.image : '',
              width: 32,
              height: 32,
              overlayColor: dark ? TColors.white : TColors.black,
            ),
             TBrandTitleWithVerifiedIcon(
              title: product.brand != null ? product.brand!.name : '',
              brandTextSizes: TextSizes.medium,
            )
          ],
        ),
      ],
    );
  }
}
