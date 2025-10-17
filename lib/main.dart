import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:template/base.dart'; 

Future<void> main() async {
  //make sure the engine is running before plugin the firebase
     WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  runApp(const MyApp());
}
