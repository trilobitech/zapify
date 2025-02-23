import 'dart:io';

import 'package:args/args.dart';
import 'package:image/image.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;

import '../command.dart';
import '../ext/image.dart';
import '../ext/io.dart';

class ScreenshotCommand extends ICommand {
  ScreenshotCommand()
    : super(
        name: 'screenshot',
        description: 'Take a screenshot of the current screen',
        // options: [
        //   Option(
        //     name: 'path',
        //     description: 'Path to save the screenshot',
        //     defaultValue: 'screenshot.png',
        //   ),
        // ],
      );

  @override
  Future<void> execute() async {
    Option;
    final timestamp = DateTime.now();
    final dateFormat = DateFormat('yyyyMMdd_HHmmss');
    final formattedTime = dateFormat.format(timestamp);

    final tempFile = await Directory.systemTemp.createTempFile();
    print('[1/7] Taking screenshot...');
    await Process.run('adb', [
      'shell',
      'screencap',
      '-p',
      '/sdcard/screen.png',
    ]);
    await Process.run('adb', ['pull', '/sdcard/screen.png', tempFile.path]);
    await Process.run('adb', ['shell', 'rm', '/sdcard/screen.png']);
    print('Screenshot saved to ${tempFile.path}');

    print('[2/7] Getting AVD name...');
    final avdResult = await Process.run('adb', [
      'shell',
      'getprop',
      'ro.boot.qemu.avd_name',
    ]);
    final avdName = avdResult.stdout.toString().trim();
    print('AVD: $avdName');

    print('[3/7] Locating AVD config...');
    final avdHome =
        Platform.environment['ANDROID_AVD_HOME'] ??
        '${Platform.environment['HOME']}/.android/avd';
    final avdIniFile = File(p.join(avdHome, '$avdName.ini'));
    final avdIniContent = avdIniFile.readAsLinesSync();
    final avdPath =
        avdIniContent
            .firstWhere((line) => line.trim().startsWith('path'))
            .split('=')[1]
            .trim();
    final configFile = File(p.join(avdPath, 'config.ini'));

    print('[4/7] Reading skin path...');
    final config = configFile.readAsLinesSync();
    final skinPath =
        config
            .firstWhere((line) => line.trimLeft().startsWith('skin.path'))
            .split('=')[1]
            .trim();

    final resolvedSkinPath =
        p.isAbsolute(skinPath)
            ? skinPath
            : p.normalize(p.join(avdPath, skinPath));
    final layoutFile = File(p.join(resolvedSkinPath, 'layout'));
    final layout = await layoutFile.readAsString();

    print('[5/7] Parsing layout for offsets and image names...');
    final parsed = parseSkinLayout(layout);
    // print('Parsed layout: $parsed');
    final bgImage = File(
      p.join(resolvedSkinPath, parsed['parts.portrait.background.image']),
    );
    final fgImage = File(
      p.join(resolvedSkinPath, parsed['parts.portrait.foreground.mask']),
    );

    final background = await bgImage.readAsImage();
    final foreground = await fgImage.readAsImage();
    final screenshot = await tempFile.readAsImage();

    final canvas = Image(
      width: background.width,
      height: background.height,
      numChannels: 4,
    );
    final radius = parsed['parts.device.display.corner_radius'] as int? ?? 0;
    final clippedScreenshot = applyRoundedCorners(screenshot, radius);

    compositeImage(canvas, background);
    compositeImage(
      canvas,
      clippedScreenshot,
      dstX: parsed['layouts.portrait.part2.x'],
      dstY: parsed['layouts.portrait.part2.y'],
      dstH: parsed['parts.device.display.height'],
      dstW: parsed['parts.device.display.width'],
    );
    compositeImage(
      canvas,
      foreground,
      dstX: parsed['layouts.portrait.part2.x'],
      dstY: parsed['layouts.portrait.part2.y'],
      dstH: parsed['parts.device.display.height'],
      dstW: parsed['parts.device.display.width'],
    );

    final outputFile = File('${avdName}_$formattedTime.png');
    await outputFile.writeAsBytes(encodePng(canvas));

    print('[6/7] Saved final image to ${outputFile.path}');
    print('[7/7] Cleaning up...');
    tempFile.deleteSync();
  }
}

// A parser for the Android skin layout format that returns a flat Map with dotted keys.
Map<String, dynamic> parseSkinLayout(String input) {
  final lines = input.split('\n').map((l) => l.trim()).toList();
  int index = 0;

  final result = <String, dynamic>{};

  List<String> context = [];

  while (index < lines.length) {
    final line = lines[index++];

    if (line.isEmpty || line.startsWith('#')) continue;

    if (line.endsWith('{')) {
      final blockName = line.replaceAll('{', '').trim();
      context.add(blockName);
    } else if (line == '}') {
      context.removeLast();
    } else {
      final parts = line.split(RegExp(r'\s+'));
      if (parts.length >= 2) {
        final key = parts[0];
        final value = parts.sublist(1).join(' ');
        final fullKey = [...context, key].join('.');
        result[fullKey] = num.tryParse(value) ?? value;
      }
    }
  }

  return result;
}

Image applyRoundedCorners(Image img, int radius) {
  final result = Image.from(img);
  final w = result.width;
  final h = result.height;

  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      bool inCorner = false;

      if (x < radius && y < radius) {
        inCorner =
            (x - radius) * (x - radius) + (y - radius) * (y - radius) >
            radius * radius;
      } else if (x >= w - radius && y < radius) {
        inCorner =
            (x - (w - radius - 1)) * (x - (w - radius - 1)) +
                (y - radius) * (y - radius) >
            radius * radius;
      } else if (x < radius && y >= h - radius) {
        inCorner =
            (x - radius) * (x - radius) +
                (y - (h - radius - 1)) * (y - (h - radius - 1)) >
            radius * radius;
      } else if (x >= w - radius && y >= h - radius) {
        inCorner =
            (x - (w - radius - 1)) * (x - (w - radius - 1)) +
                (y - (h - radius - 1)) * (y - (h - radius - 1)) >
            radius * radius;
      }

      if (inCorner) {
        result.setPixelRgba(x, y, 0, 0, 0, 0); // transparent
      }
    }
  }

  return result;
}
