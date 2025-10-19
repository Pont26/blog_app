import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/base.dart';
import 'package:template/core/common/controller/auth_controller.dart'; 

Future<void> main() async {
  //make sure the engine is running before plugin the firebase
     WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  Get.put(AuthController(), permanent: true);

  runApp(const MyApp());
}
