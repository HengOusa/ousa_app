import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ousa_app/common/appbar/appbar.dart';
import 'package:ousa_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:ousa_app/common/widgets/shimmers/TVerticalProductShimmer.dart';
import 'package:ousa_app/features/shop/controllers/product/all_products_controller.dart';
import 'package:ousa_app/features/shop/models/product_model.dart';
import 'package:ousa_app/utils/constants/size.dart';
import 'package:ousa_app/utils/helpers/cloud_helper_functions.dart';

class AllProducts extends StatelessWidget {
  const AllProducts(
      {super.key, required this.title, this.query, this.futureMethod});
  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    // Initialize controller for manageing product fetching
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar: TAppBar(
        title: Text('Popular Products'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductsQuery(query),
              builder: (context, snapshot) {
                // Check the state of the FutureBuider snapshot
                const loader = Tverticalproductshimmer();
                final widget = TCloudHelperFunction.checkMultiRecoredState(snapshot: snapshot,loader:   loader);

                // Return appropriate widget based on snapshot state
                if(widget != null) return widget;

                
                // if(snapshot.connectionState == ConnectionState.waiting){
                //   return loader;
                // }

                // if(!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty){
                //   return const Center(child: Text('No Data Found!'),);
                // }

                // if(snapshot.hasError){
                //   return const Center(child: Text('Something went wrong.'),);
                // }

                // Product found!

                final products = snapshot.data!;


                return  TSortableProducts(products: products,);
              }),
        ),
      ),
    );
  }
}
