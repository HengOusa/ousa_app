

import 'package:get/get.dart';
import 'package:ousa_app/features/authentication/controllers/signup/network_manager.dart';

class GeneralBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
  
}