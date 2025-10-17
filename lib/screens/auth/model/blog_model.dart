import 'dart:core';

class Blog {
  final String? id;
  final String title;
  final String content;
  final String? userId;
  final DateTime? deleteAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Blog({
    this.id,
    required this.title,
    required this.content,
    required this.userId,
    this.deleteAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    final String? deleteAtString = json['DeleteAt'] as String?;
    final String? createdAtString = json['CreatedAt'] as String?;
    final String? updatedAtString = json['UpdatedAt'] as String?;
    return Blog(
      id: json['Id'] as String?,
      title: json['Title'] as String,
      content: json['Content'] as String,
      userId: json['UserId'] as String?,
      createdAt:
          createdAtString != null ? DateTime.parse(createdAtString) : null,
      updatedAt:
          updatedAtString != null ? DateTime.parse(updatedAtString) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Title': title,
      'Content': content,
      'UserId': userId,
    };
  }
}
