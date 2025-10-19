import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:template/core/routes/routes.dart';
import 'package:template/core/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
     themeMode: ThemeMode.light,
     theme: AppTheme().appDarkTheme,
      darkTheme: AppTheme().appDarkTheme,
      initialRoute: Navi.splash,
      getPages: Navi.pages,      
    );
  }
}

