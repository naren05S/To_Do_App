import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:what_todo/routes/RoutesGetX.dart';
import 'package:what_todo/theme/ThemeController.dart';
import 'package:what_todo/theme/Themes.dart';

void main() {
  Get.put(ThemeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: RoutesGetX.routes,
      // onGenerateRoute: Routes.generateRoute,
      initialRoute: '/',//MyRoutes.initialRoute,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeController.to.themeMode,
    );
  }
}
