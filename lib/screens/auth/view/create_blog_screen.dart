import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/screens/auth/controller/create_blog_controller.dart';
import 'package:template/screens/auth/view/widgets/appbar_widget.dart';

class CreateBlogScreen extends StatelessWidget {
   CreateBlogScreen({super.key});
  final CreateBlogController _controller = Get.put(CreateBlogController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        "Create Blog",
        actionText: "Publish",
        onActionPressed: () async {
         await _controller.saveBlog();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              style: TextStyle(
                fontSize: 30,
              ),
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
            TextField(
              controller: _controller.contentController,
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
          ],
        ),
      ),
    );
  }
}
