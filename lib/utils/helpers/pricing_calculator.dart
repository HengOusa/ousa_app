

class TPricingCalculator{
  // -- Calulate Prices based on tax and chipping
  static double calculateTotalPrice(double productPrice,String location){
    double taxtRate = getTaxRateForLocation(location);
    double taxtAmount = productPrice * taxtRate;

    double shippingCost = getShippingCost(location);

    double totalPrice = productPrice + taxtAmount + shippingCost;
    return totalPrice;
  }

  // -- Calculate shipping cost

  static String calculateShippingCost(double productPrice,String location){
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }
  // calculate tax
  static String calculateTax(double productPrice,String location){
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location){
    // Lookup the tax rate for the given location from a tax rate database or API.
    // Return the appropriate tax rate.
    return 0.10;
  }
  static double getShippingCost(String location){
    return 5.00;
  }

  // -- Sum all cart values and return total amount
  // static double calculateCartTotal(CartModel cart){
  //   return cart.items.map((e)=>e.price).fold(0,(previousPrice,currentPrice)=>previousPrice + (currentPrice ??  0));
  // }
}