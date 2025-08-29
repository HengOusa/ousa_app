import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ousa_app/app.dart';
import 'package:ousa_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ousa_app/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  // Todo: Add Widgets Bindings
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  // Todo: GETx Local Storage
  await GetStorage.init();
  // Todo: Await Native Firebase
  // Await Splash until other itens Loading
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Todo: Initialize Firebase

  // -- Initialize Firebase & Authentication Repositories

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  // Todo: Initialize Authentication

  await Supabase.initialize(
    url: 'https://igzzekyuiqcgwtaeqyei.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imlnenpla3l1aXFjZ3d0YWVxeWVpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzUyMDk4NTQsImV4cCI6MjA1MDc4NTg1NH0.UAdwEiF1ajNw0IAkAMXInfhN-BHnXTC3m8lZiXCL8TQ',
  );

  // Load all the Material Design / Themes  / Locallizations / Bindings
  runApp(const Myapp());
}
