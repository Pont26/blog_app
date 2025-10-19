import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/constant/app_local_image.dart';
import 'package:template/core/common/controller/user_controller.dart';


class SlashPage extends StatelessWidget {
  const SlashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashController controller = Get.find<SplashController>();


    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Obx(() {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                slashImg,
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 20),
              const Text(
                "Welcome to Blog APP",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 30),
              // Show loading indicator only while loading
              if (controller.isLoading.value)
                const CircularProgressIndicator(color: Colors.white),
            ],
          );
        }),
      ),
    );
  }
}
