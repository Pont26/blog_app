import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:template/core/constant/constant.dart';
import 'package:template/core/services/network_services.dart';
import 'package:template/core/services/signInWithGoogle_Service.dart';
import 'package:template/screens/blog/controller/blog_controller.dart';
import 'package:template/screens/blog/model/blog_model.dart';

class CreateBlogBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CreateBlogController>(CreateBlogController());
  }
}

class CreateBlogController extends GetxController {
  late final TextEditingController titleController;
  late final TextEditingController contentController;

  final GoogleAuthService _authService = GoogleAuthService();
  final NetworkService _networkService = NetworkService();

  @override
  void onInit() {
    super.onInit();
    titleController = TextEditingController();
    contentController = TextEditingController();
  }

  Future<void> saveBlog() async {
    if (titleController.text.trim().isEmpty) {
      Get.snackbar("Validation Error", "Title cannot be empty",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (contentController.text.trim().isEmpty) {
      Get.snackbar("Validation Error", "Content cannot be empty",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    User? user = await _authService.signInWithGoogle();
    if (user == null) return;

    final blogData = {
      'title': titleController.text.trim(),
      'content': contentController.text.trim(),
      'userId': user.uid,
    };

    try {
      final response = await _networkService.postMethodCalling(
        url: APIURLS().blogsURL(),
        data: blogData,
      );

      final decoded = json.decode(response.body);
      final createdBlog = Blog.fromJson(decoded);

      if (Get.isRegistered<BlogController>()) {
        final blogsWithUser = await fetchBlogsWithUser();

        final blogController = Get.find<BlogController>();
        final enrichedBlog =
            blogsWithUser.firstWhere((b) => b.id == createdBlog.id);

        blogController.blogs.insert(0, enrichedBlog);
        blogController.blogs.refresh();
      }

      Get.back(result: true);
    } catch (e) {
      Get.snackbar("Error", "Error adding blog: $e",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

 Future<List<Blog>> fetchBlogsWithUser() async {
  try {
    final response = await _networkService.getMethodCalling(
      url: APIURLS().blogsWithUserURL(), 
    );

    final List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => Blog.fromJson(json)).toList();
  } catch (e) {
    throw Exception("Failed to fetch blogs with user info: $e");
  }
}


  @override
  void onClose() {
    titleController.dispose();
    contentController.dispose();
    super.onClose();
  }
}
