import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:template/screens/auth/view/create_blog_screen.dart';
import 'package:template/screens/auth/view/edit_blog_screen.dart';
import 'package:template/screens/auth/view/widgets/appbar_widget.dart';
import 'package:template/screens/auth/view/widgets/cart_widget.dart';
import '../controller/blog_controller.dart'; // import your controller

class BlogScreen extends StatelessWidget {
  final User user;

  BlogScreen({super.key, required this.user});

  final BlogController controller =
      Get.put(BlogController()); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        "Blog",
        actionText: "Write",
        onActionPressed: () {
          Get.to(() => CreateBlogScreen());
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
            itemCount: controller.blogs.length,//How many items to build
            itemBuilder: (context, index) { //how to build each item
          
              final blog = controller.blogs[index];
              final formattedTime = DateFormat('dd/MM/yyyy')
                  .format(blog.updatedAt ?? DateTime.now());

              return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: cardWidget(
                    userProfile: user.photoURL,
                    userName: user.displayName,
                    title: blog.title,
                    blog: blog.content,
                    createdAt: formattedTime,
                    onEdit: () => Get.to(()=> EditBlogScreen(blog: blog)),
                    onDelete: () =>
                        controller.deleteBlog(blog),
                  ));
            },
          );
        }),
      ),
    );
  }
}
