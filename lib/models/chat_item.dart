class ChatItem {
  const ChatItem({
    required this.name,
    required this.message,
    required this.time,
    required this.avatar,
    this.isOnline = false,
    this.isUnread = false,
  });

  final String name;
  final String message;
  final String time;
  final String avatar;
  final bool isOnline;
  final bool isUnread;
}
