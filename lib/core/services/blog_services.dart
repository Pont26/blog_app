import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:template/screens/auth/model/blog_model.dart';

class BlogServices {

// private, only this class itself can call this constructor
  BlogServices._privateConstructor();

//create one single instance of it selft
  static final BlogServices _instance = BlogServices._privateConstructor();

//factory keyword allows returning an existing instance instead of creating a new one
//Every time you call BlogServices(), it returns the same _instance
//allow to return an exisitng object 
  factory BlogServices() {
    return _instance;
  }

//get method to access private instance
  static BlogServices get instance => _instance;

  final String baseUrl = "http://192.168.100.17:8008/v1/Blogs";

  Future<Blog?> createBlog(Blog blog) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(blog.toJson()),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      //takes the JSON string from the server
      //convert to dart map or list
      final data = jsonDecode(response.body);
      return Blog.fromJson(data);
    } else {
      throw Exception(
          "Failed to create blog: ${response.statusCode}, ${response.body}");
    }
  }

  Future<List<Blog>> getBlogs() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      final List<dynamic> data = body['value'];
      final blogsList = data.map((json) => Blog.fromJson(json)).toList();
      return blogsList;
    } else {
      throw Exception("Failed to load blogs");
    }
  }

  Future<Blog?> updateBlog(Blog blog) async {
    if (blog.id == null) throw Exception("Blog ID is required for update");

    final url = "$baseUrl(${blog.id})";
    final response = await http.patch(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(blog.toJson()),
    );
    if (response.statusCode == 200 || response.statusCode == 204) {
      return blog;
    } else {
      throw Exception(
          "Failed to update blog: ${response.statusCode}, ${response.body}");
    }
  }

  Future<void> deleteBlog(String id) async {
    if (id.isEmpty) throw Exception("Blog ID is required for deletion");

    final url = "$baseUrl($id)"; 

    final response = await http.delete(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 204) {
      return; 
    } else if (response.statusCode == 404) {
      throw Exception("Blog not found at the server: $url");
    } else {
      throw Exception(
          "Failed to delete blog: ${response.statusCode}, ${response.body}");
    }
  }
}
