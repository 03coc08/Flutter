class MattermostPost {
  const MattermostPost({
    required this.id,
    required this.channelId,
    required this.userId,
    required this.message,
    required this.createAt,
  });

  final String id;
  final String channelId;
  final String userId;
  final String message;
  final int createAt;

  factory MattermostPost.fromJson(Map<String, dynamic> json) {
    return MattermostPost(
      id: json['id'] as String? ?? '',
      channelId: json['channel_id'] as String? ?? '',
      userId: json['user_id'] as String? ?? '',
      message: json['message'] as String? ?? '',
      createAt: json['create_at'] as int? ?? 0,
    );
  }
}
