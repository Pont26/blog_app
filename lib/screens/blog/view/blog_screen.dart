import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:template/core/routes/routes.dart';
import 'package:template/screens/widgets/appbar_widget.dart';
import 'package:template/screens/widgets/cart_widget.dart';
import '../controller/blog_controller.dart'; // import your controller

class BlogScreen extends StatelessWidget {
  BlogScreen({super.key});

  final BlogController controller = Get.find<BlogController>();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: appBarWidget(
        "Blog",
        actionText: "Write",
        onActionPressed: () {
          Get.toNamed(Navi.createBlog);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.blogs.isEmpty) {
            return const Center(child: Text("No blogs found"));
          }

          return ListView.builder(
            itemCount: controller.blogs.length, //How many items to build
            itemBuilder: (context, index) {
              //how to build each item

              final blog = controller.blogs[index];
              final formattedTime = DateFormat('dd/MM/yyyy')
                  .format(blog.updatedAt ?? DateTime.now());

              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: cardWidget(
                  userProfile: blog.userPhotoUrl ?? '',
                  userName: blog.userName ?? 'Anonymous',
                  title: blog.title,
                  blog: blog.content,
                  createdAt: formattedTime,
                  onEdit: () => Get.toNamed(
                    Navi.updateBlog,
                    arguments: blog, 
                  ),
                  onDelete: () => controller.deleteBlog(blog),
                  blogUserId: blog.userId, // pass blog owner ID
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
