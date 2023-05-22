class ChatAppNotFoundError extends Error {
  ChatAppNotFoundError(this.message) : super();

  final String? message;

  @override
  String toString() => 'OpenChatAppError: $message';
}
