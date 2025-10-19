import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/screens/edit_blog/controller/edit_blog_controller.dart';
import 'package:template/screens/blog/model/blog_model.dart';
import 'package:template/screens/widgets/appbar_widget.dart';

class EditBlogScreen extends StatelessWidget {
  final Blog blog;
  late final EditBlogController _controller;

  EditBlogScreen({super.key, required this.blog}) {
    _controller = Get.find<EditBlogController>();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        "Update Blog",
        actionText: "Publish",
        onActionPressed: () async {
          await _controller.updateBlog();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title TextField
            TextField(
              controller: _controller.titleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Title",
                hintStyle: TextStyle(
                  fontSize: 30,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Content TextField
            Expanded(
              child: TextField(
                controller: _controller.bodyController, 
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Tell your story....",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
