import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/constant/app_api_endpoint.dart';
import 'package:template/core/services/network_services.dart';
import 'package:template/screens/blog/model/blog_model.dart';


class BlogBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BlogController>(BlogController());
  }
}

class BlogController extends GetxController {
  var blogs = <Blog>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBlogs();
  }

  /// ✅ Fetch blogs with user info
  Future<void> fetchBlogs() async {
    try {
      isLoading(true);
      final response = await NetworkService().getMethodCalling(
        url: APIURLS().blogsWithUserURL(),
      );
      final List<dynamic> data = jsonDecode(response.body);
      blogs.value = data.map((json) => Blog.fromJson(json)).toList();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  /// ✅ Delete blog with confirmation dialog
  Future<void> deleteBlog(Blog blog) async {
    final confirmed = await Get.defaultDialog<bool>(
      backgroundColor: Colors.black,
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
        await NetworkService().deleteMethodCalling(
          url: "${APIURLS().blogsURL()}(${blog.id})",
        );

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
