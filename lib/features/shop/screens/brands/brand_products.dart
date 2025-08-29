import 'package:flutter/material.dart';
import 'package:ousa_app/common/appbar/appbar.dart';
import 'package:ousa_app/common/widgets/brands/brand_cart.dart';
import 'package:ousa_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:ousa_app/utils/constants/size.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: Text('Nike'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Brand Details
              TBranCart(showBorder: true),
              SizedBox(height: TSizes.spaceBtwSections),
              TSortableProducts(products: []),
            ],
          ),
        ),
      ),
    );
  }
}
