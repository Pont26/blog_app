import 'package:get/get.dart';
import 'package:template/core/common/controller/user_controller.dart';
import 'package:template/screens/blog/controller/blog_controller.dart';
import 'package:template/screens/create_blog/controller/create_blog_controller.dart';
import 'package:template/screens/edit_blog/controller/edit_blog_controller.dart';
import 'package:template/screens/blog/model/blog_model.dart';
import 'package:template/screens/screens.dart';



class Navi {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String blog = '/blog';
  static const String createBlog = '/create-blog';
  static const String updateBlog = '/update-blog';

  static List<GetPage> get pages => [
        GetPage(
          name: splash,
          page: () => const SlashPage(),
          binding: SplashBinding(),
        ),
        GetPage(
          name: login,
          page: () => const LoginScreen(),
        ),
         GetPage(
          name: blog,
          page: () =>  BlogScreen(),
          binding: BlogBinding()
        ),
        GetPage(
            name: createBlog,
            page: () => CreateBlogScreen(),
            binding: CreateBlogBinding()),
        GetPage(
          name: updateBlog,
          page: () => EditBlogScreen(blog: Get.arguments as Blog),
          binding: BindingsBuilder(() {
            Get.put(EditBlogController(originalBlog: Get.arguments as Blog));
          }),
        ),
      ];
}
