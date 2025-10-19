class APIURLS {
  static const String baseURL = "http://192.168.99.23:8008/v1";

  String blogsURL() => '$baseURL/Blogs';
  String blogsWithUserURL() => '$baseURL/blogs-with-user';
}
