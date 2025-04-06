class Post {
  final String title;
  final String description;
  final List<String> imageUrl;
  final String userId;

  Post({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.userId,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: List<String>.from(json['imageUrl'] ?? []),
      userId: json['userId'] ?? '',
    );
  }
}
