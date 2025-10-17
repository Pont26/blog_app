import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/screens/auth/view/login_screen.dart';

class SlashPage extends StatelessWidget {
  const SlashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Get.to(()=> const LoginScreen());
        },
        child: Center(
          child: Column(    
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/slash_img.png', width: 150, height: 150,),
            Text(
              "Welcome to  Blog APP",
             
            )
          ],
        ),
       
      ),
      ),
    );
  }
}