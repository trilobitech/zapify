abstract class Failure {
  String get message;
}

class MessageFailure extends Failure {
  MessageFailure(this.message);

  @override
  String message;
}
