import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ousa_app/common/appbar/appbar.dart';
import 'package:ousa_app/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:ousa_app/features/shop/screens/checkout/checkout.dart';
import 'package:ousa_app/utils/constants/size.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace), child: TCartItems()),
          // Checkout Butto n
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => const CheckoutScreen()),
            child: const Text('Checkout \$256.0')),
      ),
    );
  }
}
