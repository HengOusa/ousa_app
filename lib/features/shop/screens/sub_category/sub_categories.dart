import 'package:flutter/material.dart';
import 'package:ousa_app/common/appbar/appbar.dart';
import 'package:ousa_app/common/widgets/images/t_Bounded_image.dart';
import 'package:ousa_app/common/widgets/products/product_card/product_cart_horizontal.dart';
import 'package:ousa_app/common/widgets/texts/section_heading.dart';
import 'package:ousa_app/utils/constants/image_strings.dart';
import 'package:ousa_app/utils/constants/size.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Sports'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Banner
              const TBoundedImage(
                width: double.infinity,
                imageUrl: TImages.promoBanner2,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // Sub-categories
              Column(
                children: [
                  //Heading
                  TSectionHeading(
                    title: 'Sports shirts',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                ],
              ),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: TSizes.spaceBtwItems),
                  itemBuilder: (context, index) =>
                      const TProductCartHorizontal(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
