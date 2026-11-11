class Channel {
  final String id;
  final String name;
  final String displayName;
  final String type;
  final int lastPostAt;

  Channel({
    required this.id,
    required this.name,
    required this.displayName,
    required this.type,
    required this.lastPostAt,
  });

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      id: json['id'],
      name: json['name'] ?? '',
      displayName: json['display_name'] ?? '',
      type: json['type'] ?? '',
      lastPostAt: json['last_post_at'] ?? 0,
    );
  }
}
