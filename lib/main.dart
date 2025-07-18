import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'AppUi/Utlies/routes/app_routes.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.pages,
    ),
  );
}
