import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:template/core/theme/theme.dart';
import 'package:template/screens/auth/view/slash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         brightness: Brightness.dark,
        textTheme: darkTextTheme,  
        colorScheme: darkScheme,
        fontFamily: fontFamily,
      ),
      home: const SlashPage(),
    );
  }
}
