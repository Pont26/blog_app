import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:template/core/services/blog_services.dart';
import 'package:template/core/services/signInWithGoogle_Service.dart';
import 'package:template/screens/auth/controller/blog_controller.dart';
import 'package:template/screens/auth/model/blog_model.dart';

class CreateBlogController extends GetxController{
  late final TextEditingController titleController;
  late final TextEditingController  contentController;
   //add service
   final GoogleAuthService _authService = GoogleAuthService();
   final BlogServices _blogServices = BlogServices();
   @override
  void onInit() {
    super.onInit();

    titleController = TextEditingController(text: '');
    contentController = TextEditingController(text: '');
  }

 Future<void> saveBlog() async {
    if (titleController.text.trim().isEmpty) {
    Get.snackbar(
      "Validation Error",
      "Title cannot be empty",
      snackPosition: SnackPosition.BOTTOM,
    );
    return;
  }

  if (contentController.text.trim().isEmpty) {
    Get.snackbar(
      "Validation Error",
      "Content cannot be empty",
      snackPosition: SnackPosition.BOTTOM,
    );
    return;
  }
  User? user = await _authService.signInWithGoogle();
  if (user == null) return;

  final blog = Blog(
    title: titleController.text.trim(),
    content: contentController.text.trim(),
    userId: user.uid,
  );

  try {
    final createdBlog = await _blogServices.createBlog(blog);
    if (createdBlog != null) {
       if (Get.isRegistered<BlogController>()) {
        final blogController = Get.find<BlogController>();
        blogController.blogs.insert(0, createdBlog); // add to top
        blogController.blogs.refresh(); // update UI
      }
      Get.back(result: true);
    } else {
      Get.snackbar("Save Failed", "Failed to save blog",
          snackPosition: SnackPosition.BOTTOM);
    }
  } catch (e) {
    Get.snackbar("Error", "Error adding blog: $e",
        snackPosition: SnackPosition.BOTTOM);
  }
}

}