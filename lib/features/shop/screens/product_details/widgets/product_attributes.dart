import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ousa_app/common/widgets/chips/choice_chip.dart';
import 'package:ousa_app/common/widgets/products/product_card/TProduct_price_text.dart';
import 'package:ousa_app/common/widgets/products/product_card/TRoundedContainer.dart';
import 'package:ousa_app/common/widgets/texts/product_title_text.dart';
import 'package:ousa_app/common/widgets/texts/section_heading.dart';
import 'package:ousa_app/features/shop/controllers/product/variation_controller.dart';
import 'package:ousa_app/features/shop/models/product_model.dart';
import 'package:ousa_app/utils/constants/colors.dart';
import 'package:ousa_app/utils/constants/size.dart';
import 'package:ousa_app/utils/helpers/helper_fucntions.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Column(
      children: [
        // --- selected Attribute Pricing & Description
        // Display variation price and stock when some variation is selected
        if(controller.selectedVariation.value.id.isNotEmpty)
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkGrey : TColors.grey,
          child: Column(
            children: [
              // Title , price and Stock Status
              Row(
                children: [
                  const TSectionHeading(
                      title: 'Variation', showActionButton: false),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: TSizes.spaceBtwItems),
                      Row(
                        children: [
                          const TProductTitleText(
                            title: 'Price : ',
                            smallSize: true,
                          ),
                          const SizedBox(width: TSizes.spaceBtwItems),

                          // Actual Price
                          if(controller.selectedVariation.value.salePrice>0)
                          Text(
                            '\$${controller.selectedVariation.value.price}',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: TSizes.spaceBtwItems),

                          // Sele Price
                           TProductPriceText(price: controller.getVariationPrice())
                        ],
                      ),
                      // Stock
                      Row(
                        children: [
                          const TProductTitleText(title: 'Stock' , smallSize: true),
                          Text(controller.variationStockStatus.value ,style: Theme.of(context).textTheme.titleMedium),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              // --- Variations Description ---
               TProductTitleText(
                title:
                    controller.selectedVariation.value.description ?? '', 
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        // --- Attributes
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map(
                  (attribute) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       TSectionHeading(
                        title: attribute.name ?? '',
                        showActionButton: false,
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 2),
                      Obx(
                        ()=> Wrap(
                          spacing: 8,
                          
                          children: 
                           attribute.values!.map((attributeValue){
                            final isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                            final available = controller.getAttributesAvailabilityInVariation(product.productVariations!, attribute.name!).contains(attributeValue);
                            return TChoiceChip(text: attributeValue, selected: isSelected,onSelected: available ? (selected){
                              if(selected && available){
                                controller.onAttributeSelect(product, attribute.name ?? '', attributeValue);
                              }
                            }: null,);
                           }).toList()
                          
                        ),
                      )
                    ],
                  ),
                )
                .toList()),

        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     const TSectionHeading(title: 'Colors'),
        //     const SizedBox(height: TSizes.spaceBtwItems / 2),
        //     Wrap(
        //       spacing: 8,
        //       children: [
        //         TChoiceChip(
        //             text: 'EU 34', selected: true, onSelected: (value) {}),
        //         TChoiceChip(
        //             text: 'EU 36', selected: false, onSelected: (value) {}),
        //         TChoiceChip(
        //             text: 'EU 38', selected: false, onSelected: (value) {}),
        //       ],
        //     )
        //   ],
        // )
      ],
    );
  }
}
