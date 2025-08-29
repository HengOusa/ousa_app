import 'package:flutter/material.dart';
import 'package:ousa_app/common/widgets/layouts/grid_layout.dart';
import 'package:ousa_app/common/widgets/shimmers/shimmerEffect.dart';
import 'package:ousa_app/utils/constants/size.dart';

class Tverticalproductshimmer extends StatelessWidget {
  const Tverticalproductshimmer({
    super.key,
    this.itemCount = 4,
  });
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Tshimmereffect(width: 180, height: 180),
            SizedBox(height: TSizes.spaceBtwItems),

            // Text
            Tshimmereffect(width: 160, height: 15),
            SizedBox(height: TSizes.spaceBtwItems / 2),
            Tshimmereffect(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}
