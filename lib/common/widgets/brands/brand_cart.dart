
import 'package:flutter/material.dart';
import 'package:ousa_app/common/widgets/images/t_circular_image.dart';
import 'package:ousa_app/common/widgets/products/product_card/TRoundedContainer.dart';
import 'package:ousa_app/common/widgets/texts/t_bran_title_text_with_verified_icon.dart';
import 'package:ousa_app/utils/constants/colors.dart';
import 'package:ousa_app/utils/constants/enums.dart';
import 'package:ousa_app/utils/constants/image_strings.dart';
import 'package:ousa_app/utils/constants/size.dart';
import 'package:ousa_app/utils/helpers/helper_fucntions.dart';

class TBranCart extends StatelessWidget {
  const TBranCart({
    super.key,
    required this.showBorder,
    this.onTap,
  });
  final bool showBorder;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            // Icon
            Flexible(
              child: TCircularImage(
                image: TImages.clothIcon,
                isNetworkImage: false,
                backgroundColor: Colors.transparent,
                overlayColor: THelperFunctions.isDarkMode(context)
                    ? TColors.white
                    : TColors.black,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),

            // Text

            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TBrandTitleWithVerifiedIcon(
                    title: 'Nike',
                    brandTextSizes: TextSizes.large,
                  ),
                  Text(
                    '256 products have many text in this all',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
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
