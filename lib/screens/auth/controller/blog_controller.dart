import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/services/blog_services.dart';
import 'package:template/screens/auth/model/blog_model.dart';

class BlogController extends GetxController {
  var blogs = <Blog>[].obs;     
  var isLoading = true.obs;   
  final BlogServices services = BlogServices();

  @override
  void onInit() {
    super.onInit();
    fetchBlogs();
  }

  void fetchBlogs() async {
    try {
      isLoading(true);
      List<Blog> fetchedBlogs = await services.getBlogs(); 
      blogs.assignAll(fetchedBlogs);                   
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
 Future<void> deleteBlog(Blog blog) async {
    final confirmed = await Get.defaultDialog<bool>(
      title: 'Delete Blog?',
      content: const Text('This action cannot be undone.'),
      barrierDismissible: false,
      actions: [
        TextButton(
          onPressed: () => Get.back(result: false),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Get.back(result: true),
          child: const Text(
            'Delete',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );

    if (confirmed == true) {
      try {
        await services.deleteBlog(blog.id!);

        blogs.removeWhere((b) => b.id == blog.id);

        Get.snackbar(
          "Success",
          "Blog deleted",
          snackPosition: SnackPosition.BOTTOM,
        );
      } catch (e) {
        Get.snackbar(
          "Error",
          "Failed to delete blog: $e",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }
}