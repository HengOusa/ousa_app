import 'package:flutter/material.dart';
import 'package:ousa_app/common/appbar/appbar.dart';
import 'package:ousa_app/common/widgets/products/ratings/rating_indicator.dart';
import 'package:ousa_app/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:ousa_app/features/shop/screens/product_reviews/widgets/user_review_cart.dart';
import 'package:ousa_app/utils/constants/image_strings.dart';
import 'package:ousa_app/utils/constants/size.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: const TAppBar(
        title: Text(
          'Reviews & Ratings',
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Ratings and reviews are vertified and are from people who use the same type of device that youn use."),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              // Overall Product Rating
              const TOverallProductRating(),
              TRatingBarIndicator(rating: 3.5),

              Text('12.611', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBtwSections),

              // User Reviws List
              const UserReviewCard(image: TImages.userProfileImage1),
              const UserReviewCard(image: TImages.userProfileImage2),
              const UserReviewCard(image: TImages.userProfileImage3),
            ],
          ),
        ),
      ),
    );
  }
}
