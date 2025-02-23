import 'dart:async';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:get_it/get_it.dart';

typedef ArgsBuilder = ArgParser Function(ArgParser parser);

ArgParser _defaultArgsBuilder(ArgParser parser) => parser;

abstract class ICommand extends Command<int> {
  ICommand({
    required this.name,
    required this.description,
    ArgsBuilder argsBuilder = _defaultArgsBuilder,
  }) : argParser = argsBuilder(ArgParser()),
       super();

  @override
  final String name;

  @override
  final String description;

  @override
  final ArgParser argParser;

  late final env = GetIt.instance.get<Map<String, String>>(instanceName: 'env');

  FutureOr<void> execute();

  @override
  Future<int> run() async {
    try {
      await execute();
      return 0;
    } catch (e, s) {
      print('❌ Error: $e');
      print(s);
      return 1;
    }
  }
}
