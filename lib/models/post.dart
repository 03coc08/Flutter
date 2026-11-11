class Post {
  final String id;
  final String channelId;
  final String userId;
  final String message;
  final String type;
  final int createAt;

  Post({
    required this.id,
    required this.channelId,
    required this.userId,
    required this.message,
    required this.type,
    required this.createAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      channelId: json['channel_id'],
      userId: json['user_id'],
      message: json['message'] ?? '',
      type: json['type'] ?? '',
      createAt: json['create_at'] ?? 0,
    );
  }

  static List<Post> fromPostList(Map<String, dynamic> json) {
    final List order = json['order'];
    final Map posts = json['posts'];

    final result = <Post>[];
    for (final id in order) {
      result.add(Post.fromJson(posts[id]));
    }
    return result;
  }
}
