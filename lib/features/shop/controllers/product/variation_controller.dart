

import 'package:get/get.dart';
import 'package:ousa_app/features/shop/controllers/product/image_controller.dart';
import 'package:ousa_app/features/shop/models/product_attribute_model.dart';
import 'package:ousa_app/features/shop/models/product_model.dart';
import 'package:ousa_app/features/shop/models/product_variation_model.dart';

class VariationController extends GetxController{
  static VariationController get instance => Get.find();

  // Variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty().obs;

  // Select Attribute , and Variation
  void onAttributeSelect(ProductModel product,attributeName,attributeValue){
  // When attribute is selected we will first add that attribute to the selected Attributes
  final selectedAttributes = Map<String, dynamic>.from(this.selectedAttributes);
  selectedAttributes[attributeName] = attributeValue;
  this.selectedAttributes[attributeName] = attributeValue;

  final selectedVariation = product.productVariations!.firstWhere((variation)=> _isSameAttributeValues(variation.attributeValues, selectedAttributes),orElse: ()=> ProductVariationModel.empty(),
  );
  // Show the selected Variation image as a Main Image
  if(selectedVariation.image.isNotEmpty){
    ImagesController.instance.selectedProductImage.value = selectedVariation.image;
  }

  // Assign Selected Variation
  this.selectedVariation.value = selectedVariation;

  // update selected product variation status
  getProductVariationStockStatus();

  }



  // -- check if selected attributes matches any variation attributes
  bool _isSameAttributeValues(Map<String,dynamic> variationAttributes , Map<String,dynamic> selectedAttributes){
    // If selectedAttribute contains 3 attributes and currect variation contains 2 then return.
    if(variationAttributes.length != selectedAttributes.length) return false;
   // If any of the attributes is different then return e.g [Green , Large ] X [Green , Small]
   for(final key in variationAttributes.keys){
    // Attributes[Key] = Value which could be [Green , Small ,Cotton] etc.
    if(variationAttributes[key] != selectedAttributes[key]) return false;
   }
   return true;
  }



// check Attribute availability / Stock Variation 
  Set<String?> getAttributesAvailabilityInVariation(List<ProductVariationModel> variations, String attributeName){
    // Pass the variables to check which attributes are available and stock is not 0
    final availableVariationAttributesValues = variations.where((variation)=>
    // Check empty / Out of stock Attributes
    variation.attributeValues[attributeName] != null && variation.attributeValues[attributeName]!.isNotEmpty && variation.stock > 0 )
    .map((variation) => variation.attributeValues[attributeName])
    .toSet();
    return availableVariationAttributesValues;
  }

  String getVariationPrice(){
    return (selectedVariation.value.salePrice > 0 ? selectedVariation.value.salePrice : selectedVariation.value.price).toString();
  }

  // -- Check Product variation Stock Status
  void getProductVariationStockStatus(){
    variationStockStatus.value = selectedVariation.value.stock > 0 ? 'In Stock':'Out of Stock';
  }

  // -- Reset Selected Attributes when switching products
  void resetSelectedAttributes(){
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}