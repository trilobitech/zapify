import 'dart:io';

import 'package:image/image.dart';
import 'package:path/path.dart' as path;

import '../command.dart';
import '../ext/image.dart';
import 'screenshot.dart';

class AddFrameCommand extends ICommand {
  AddFrameCommand()
    : super(
        name: 'add_frame',
        description: 'Add skin frame to screenshot(s)',
        argsBuilder:
            (parser) =>
                parser
                  ..addOption('skin', defaultsTo: 'pixel_9')
                  ..addMultiOption('screenshots'),
      );

  @override
  Future<void> execute() async {
    final skin = Skin.auto(argResults!.option('skin')!);

    final layoutFile = File(path.join(skin.directory, 'layout'));
    final layout = await layoutFile.readAsString();
    final parsedLayout = parseSkinLayout(layout);

    final bgImage = File(
      path.join(
        skin.directory,
        parsedLayout['parts.portrait.background.image'],
      ),
    );
    final fgImage = File(
      path.join(skin.directory, parsedLayout['parts.portrait.foreground.mask']),
    );

    final background = await bgImage.readAsImage();
    final foreground = await fgImage.readAsImage();

    final screenshots = argResults?.multiOption('screenshots') ?? [];

    await Future.wait(
      screenshots.map(
        (e) => _addSkin(
          e,
          skinName: skin.name,
          layoutData: parsedLayout,
          background: background,
          foreground: foreground,
        ),
      ),
    );
  }

  Future<void> _addSkin(
    String screenshotPath, {
    required String skinName,
    required Map<String, dynamic> layoutData,
    required Image background,
    required Image foreground,
  }) async {
    final inputFile = File(screenshotPath);
    final outputPath = screenshotPath.replaceFirst(
      RegExp(r'/(android|ios)/'),
      '/$skinName/',
    );
    final outputFile = File(outputPath);
    print('Adding skin to file: $screenshotPath...');

    final screenshot = await inputFile.readAsImage();

    final canvas = Image(
      width: background.width,
      height: background.height,
      numChannels: 4,
    );
    final radius =
        layoutData['parts.device.display.corner_radius'] as int? ?? 0;
    final clippedScreenshot = applyRoundedCorners(screenshot, radius);

    compositeImage(canvas, background);
    compositeImage(
      canvas,
      clippedScreenshot,
      dstX: layoutData['layouts.portrait.part2.x'],
      dstY: layoutData['layouts.portrait.part2.y'],
      dstH: layoutData['parts.device.display.height'],
      dstW: layoutData['parts.device.display.width'],
    );
    compositeImage(
      canvas,
      foreground,
      dstX: layoutData['layouts.portrait.part2.x'],
      dstY: layoutData['layouts.portrait.part2.y'],
      dstH: layoutData['parts.device.display.height'],
      dstW: layoutData['parts.device.display.width'],
    );

    await outputFile.parent.create(recursive: true);
    await outputFile.writeAsBytes(encodePng(canvas));
    print('File $outputPath saved successfull!');
  }
}

class Skin {
  const Skin({required this.name, required this.directory});

  factory Skin.auto(String skin) {
    if (skin.contains(path.separator)) {
      print(Directory.current.toString());
      return Skin(name: path.basename(skin), directory: path.absolute(skin));
    }

    final sdkHome =
        Platform.environment['ANDROID_SDK_ROOT'] ??
        path.join('${Platform.environment['HOME']}', 'Android', 'Sdk');

    return Skin(name: skin, directory: path.join(sdkHome, 'skins', skin));
  }

  final String name;
  final String directory;
}
