import 'dart:core';

class Blog {
  final String? id;
  final String title;
  final String content;
  final String userId;         // non-nullable now
  final String? userName;    
  final String? userPhotoUrl; 
  final DateTime? deleteAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Blog({
    this.id,
    required this.title,
    required this.content,
    required this.userId,
    this.userName,
    this.userPhotoUrl,
    this.deleteAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
  final user = json['user'] as Map<String, dynamic>?;

  return Blog(
    id: (json['id'] ?? json['Id']) as String?,
    title: (json['title'] ?? json['Title']) as String? ?? 'No Title',
    content: (json['content'] ?? json['Content']) as String? ?? 'No Content',
    userId: (json['userId'] ?? json['UserId']) as String,
    userName: user?['name'] as String?,
    userPhotoUrl: user?['photoUrl'] as String?,
    createdAt: (json['createdAt'] ?? json['CreatedAt']) != null
        ? DateTime.parse((json['createdAt'] ?? json['CreatedAt']) as String)
        : null,
    updatedAt: (json['updatedAt'] ?? json['UpdatedAt']) != null
        ? DateTime.parse((json['updatedAt'] ?? json['UpdatedAt']) as String)
        : null,
  );
}


  Map<String, dynamic> toJson() {
    // PascalCase for API
    return {
      'Title': title,
      'Content': content,
      'UserId': userId,
    };
  }
}
