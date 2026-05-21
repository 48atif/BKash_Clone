class MessageModel {
  final String id;
  final String text;
  final String role;
  final DateTime timestamp;

  MessageModel({
    required this.id,
    required this.text,
    required this.role,
    required this.timestamp,
  });
}