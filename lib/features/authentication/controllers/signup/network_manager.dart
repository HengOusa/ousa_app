// Maages the network connectivity status and provides methods to check and handle connectivity changes.
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ousa_app/utils/popups/loaders.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectivityStatus =
      ConnectivityResult.none.obs;

  // Initialize the network manager and set up a stream to continueally check the connection status
  @override
  void onInit() {
    super.onInit();
    try {
      _connectivitySubscription =
          _connectivity.onConnectivityChanged.listen((dynamic result) {
        if (result is ConnectivityResult) {
          _updateConnectionStutus(result);
        } else if (result is List<ConnectivityResult> && result.isNotEmpty) {
          // Handle the case where the result is a list
          _updateConnectionStutus(
              result.first); // Use the first result as an example
        }
      }) as StreamSubscription<ConnectivityResult>;
    } catch (e) {
      print("Error during connectivity initialization: $e");
    }
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   // _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStutus);
  //   _connectivitySubscription =
  //       _connectivity.onConnectivityChanged.listen(_updateConnectionStutus);
  // }

  // Update the Connection status based on changes in connectivity and show a relevant popup for no internet connection,
  Future<void> _updateConnectionStutus(ConnectivityResult result) async {
    _connectivityStatus.value = result;
    if (_connectivityStatus.value == ConnectivityResult.none) {
      TLoaders.warningSnackBar(title: 'No Internet Connection');
    }
  }
  // Future<void> _updateConnectionStutus(ConnectivityResult result) async{
  //   _connectivityStatus.value = result;
  //   if(_connectivityStatus.value == ConnectivityResult.none){
  //     TLoaders.warningSnackBar(title: 'No Internet Connection');
  //   }
  // }

  // Check the internet connection status
// Returns 'true' if connection , 'false' otherwise

  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

// Dipose or close the active connectivity stream
  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
