import 'package:args/command_runner.dart';

extension RunnerExt on CommandRunner {
  void addCommands(List<Command> commands) {
    commands.forEach(addCommand);
  }
}
