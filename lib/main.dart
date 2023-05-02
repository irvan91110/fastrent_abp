import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      defaultTransition: Transition.noTransition,
      theme: ThemeData(
        fontFamily: 'poppins',
      ),
      getPages: AppPages.routes,
    ),
  );
}
