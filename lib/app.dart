import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ousa_app/bindings/general_bindings.dart';
import 'package:ousa_app/routes/app_routes.dart';
import 'package:ousa_app/utils/constants/colors.dart';
import 'package:ousa_app/utils/theme/theme.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      home: const Scaffold(
        backgroundColor: TColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
