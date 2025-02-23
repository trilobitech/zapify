import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:get_it/get_it.dart';

import 'src/commands/add_frame.dart';
import 'src/commands/figma_importer.dart';
import 'src/commands/screenshot.dart';
import 'src/ext/args.dart';
import 'src/ext/env.dart';

final commands = <Command>[
  FigmaImporterCommand(),
  ScreenshotCommand(),
  AddFrameCommand(),
];

final runner = CommandRunner<int>(
  'zapify_cli',
  'A set of commands to improve development productivity',
)..addCommands(commands);

void main(List<String> args) async {
  loadDependencyRegistry();
  exit(await runner.run(args) ?? 0);
}

void loadDependencyRegistry() {
  GetIt.instance.registerSingleton<Map<String, String>>(
    EnvMap(),
    instanceName: 'env',
  );
}
