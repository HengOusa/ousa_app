import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ousa_app/common/widgets/icons/t_circular_icon.dart';
import 'package:ousa_app/utils/constants/colors.dart';
import 'package:ousa_app/utils/constants/size.dart';
import 'package:ousa_app/utils/helpers/helper_fucntions.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? TColors.darkerGrey : TColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        children: [
          Row(
            children: [
              TCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: dark ? TColors.white : TColors.darkGrey,
                width: 40,
                height: 40,
                color: dark ? TColors.black : TColors.white,
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: TSizes.spaceBtwItems),
              TCircularIcon(
                icon: Iconsax.add,
                backgroundColor: dark ? TColors.white : TColors.black,
                width: 40,
                height: 40,
                color: dark ? TColors.black : TColors.white,
              ),
            ],
          ),
          const SizedBox(width: TSizes.spaceBtwItems),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: Colors.blue,
                side: BorderSide(color: dark ? TColors.white : TColors.black)),
            child: Text(
              'Add to Cart',
              style: TextStyle(color: dark ? TColors.white : TColors.black),
            ),
          )
        ],
      ),
    );
  }
}
