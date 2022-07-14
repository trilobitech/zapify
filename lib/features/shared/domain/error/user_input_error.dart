class UserInputError implements Exception {
  UserInputError(this.message);

  final String message;

  @override
  String toString() => 'UserInputError(message: "$message")';
}
