import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:template/core/constant/app_api_endpoint.dart';
import 'package:template/core/services/network_services.dart';
import 'package:template/screens/blog/controller/blog_controller.dart';
import 'package:template/screens/blog/model/blog_model.dart';


class EditBlogBinding extends Bindings {
  final Blog originalBlog;

  EditBlogBinding({required this.originalBlog});

  @override
  void dependencies() {
    Get.put<EditBlogController>(
      EditBlogController(originalBlog: originalBlog),
    );
  }
}

class EditBlogController extends GetxController {
  final Blog originalBlog;

  late final TextEditingController titleController;
  late final TextEditingController bodyController;

  final NetworkService _networkService = NetworkService();

  EditBlogController({required this.originalBlog});

  @override
  void onInit() {
    super.onInit();
    titleController = TextEditingController(text: originalBlog.title);
    bodyController = TextEditingController(text: originalBlog.content);
  }

  Future<void> updateBlog() async {
  // 1️⃣ Validation
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


  // 3️⃣ Prepare PATCH data
  final updatedBlogData = {
    'title': titleController.text.trim(),
    'content': bodyController.text.trim(),
  };

  try {
    // 4️⃣ PATCH request
    final response = await _networkService.patchMethodCalling(
      url: "${APIURLS().blogsURL()}(${originalBlog.id})", // OData format
      data: updatedBlogData,
    );

    // 5️⃣ Fetch enriched blog list
    final blogsResponse = await _networkService.getMethodCalling(
      url: APIURLS().blogsWithUserURL(),
    );

    final List<dynamic> blogsData = json.decode(blogsResponse.body);
    final enrichedBlog = blogsData
        .map((json) => Blog.fromJson(json))
        .firstWhere((b) => b.id == originalBlog.id);

    // 6️⃣ Update BlogController list
    if (Get.isRegistered<BlogController>()) {
      final blogController = Get.find<BlogController>();
      final index =
          blogController.blogs.indexWhere((b) => b.id == enrichedBlog.id);
      if (index != -1) {
        blogController.blogs[index] = enrichedBlog;
        blogController.blogs.refresh();
      }
    }

    // 7️⃣ Close edit screen
    Get.back(result: true);
  } catch (e) {
    Get.snackbar(
      "Error",
      "Error updating blog: $e",
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
