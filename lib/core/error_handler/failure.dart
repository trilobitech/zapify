import 'package:flutter/widgets.dart';

abstract class Failure implements Exception {
  String message(BuildContext context);
}
