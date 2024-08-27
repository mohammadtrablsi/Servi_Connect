class ViewChatEntity {
  final text;
  final createdAt;
  final user;
  final expert;
  final sender;

  ViewChatEntity(
      {required this.sender,
      required this.user,
      required this.expert,
      required this.text,
      required this.createdAt});
}
