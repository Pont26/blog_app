import 'package:get/get.dart';
import 'package:template/core/common/controller/auth_controller.dart';
import 'package:template/core/routes/routes.dart';
import 'package:template/screens/screens.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}

class SplashController extends GetxController {
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    _startSplash();
  }

  void _startSplash() async {
    await Future.delayed(const Duration(seconds: 3));
    isLoading.value = false;
    final AuthController authController = Get.find<AuthController>();
    if (authController.isLoggedIn) {
      Get.offAllNamed(Navi.blog);
    } else {
      Get.offAllNamed(Navi.login);
    }
  }
}
