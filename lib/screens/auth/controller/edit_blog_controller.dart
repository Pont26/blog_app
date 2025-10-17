import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:template/core/services/blog_services.dart';
import 'package:template/screens/auth/controller/blog_controller.dart';
import 'package:template/screens/auth/model/blog_model.dart';

class EditBlogController extends GetxController{
  final Blog originalBlog;

  late final TextEditingController titleController;
  late final TextEditingController bodyController;


  final BlogServices service = BlogServices();

  EditBlogController({required this.originalBlog});

  @override
  void onInit() {
    super.onInit();

    titleController = TextEditingController(text: originalBlog.title);
    bodyController = TextEditingController(text: originalBlog.content);
  }


  Future<void> updateBlog() async {
  if (titleController.text.trim().isEmpty) {
    Get.snackbar(
      "Validation Error",
      "Title cannot be empty",
      snackPosition: SnackPosition.BOTTOM,
    );
    return;
  }

  if (bodyController.text.trim().isEmpty) {
    Get.snackbar(
      "Validation Error",
      "Content cannot be empty",
      snackPosition: SnackPosition.BOTTOM,
    );
    return;
  }
    final updatedBlog = Blog(
      id: originalBlog.id,
      title: titleController.text.trim(),
      content: bodyController.text.trim(),
      userId: originalBlog.userId,

      createdAt: originalBlog.createdAt,
      updatedAt: DateTime.now(),
    );
    try {
      final Blog? result = await service.updateBlog(updatedBlog);

      if (result != null) {
        if (Get.isRegistered<BlogController>()) {
        final blogController = Get.find<BlogController>();
        blogController.blogs.insert(0, updatedBlog); // add to top
        blogController.blogs.refresh(); // update UI
      }
        Get.back(result: true);
      } else {
        Get.snackbar(
          "Update Failed",
          "Failed to update note",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Error updating note: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    bodyController.dispose();
    super.onClose();
  }
}