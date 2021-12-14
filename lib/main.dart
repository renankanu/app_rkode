import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/theme/base_theme.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'Application',
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: BaseTheme.darkTheme,
    ),
  );
}
