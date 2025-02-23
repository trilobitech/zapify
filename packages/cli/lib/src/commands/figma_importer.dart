import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:yaml/yaml.dart';

import '../command.dart';

class FigmaImporterCommand extends ICommand {
  FigmaImporterCommand()
    : super(name: 'figma_importer', description: 'Import images from Figma');

  @override
  Future<void> execute() async {
    final options = await _readOptionsFromPubspec();
    for (final option in options) {
      await _importImagesFromFigmaProject(option);
    }
  }

  Future<void> _importImagesFromFigmaProject(
    FigmaImporterOptions options,
  ) async {
    final token = env['FIGMA_TOKEN'] ?? '';
    assert(token.isNotEmpty, 'Token não informado');

    final imageMap = options.imageMap;
    final nodeIds = imageMap.keys.join(',');
    final url =
        'https://api.figma.com/v1/images/${options.fileKey}?ids=$nodeIds&format=jpg';
    final headers = {'X-Figma-Token': token};

    // Obtendo a URL da imagem exportada
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final images = jsonResponse['images'] as Map<String, dynamic>;

      // interact over imageMap
      for (final nodeId in imageMap.keys) {
        final destination = imageMap[nodeId]!;
        final imageUrl = images[nodeId];

        if (imageUrl != null) {
          // Baixando a imagem
          final imageResponse = await http.get(Uri.parse(imageUrl));
          if (imageResponse.statusCode == 200) {
            final file = File(destination);
            await file.parent.create(recursive: true);
            await file.writeAsBytes(imageResponse.bodyBytes);
            print('✅ Image saved to $destination');
          } else {
            print('❌ Error while downloading image: ${imageResponse.body}');
          }
        } else {
          print('❌ No image found for layer $nodeId.');
        }
      }
    } else {
      print('❌ Error to obtain images: ${response.body}');
    }
  }

  /// Read Figma importer options from pubspec.yaml in key `figma_importer`
  Future<List<FigmaImporterOptions>> _readOptionsFromPubspec() async {
    final file = File('pubspec.yaml');
    if (!file.existsSync()) {
      throw Exception('pubspec.yaml not found');
    }

    final content = await file.readAsString();
    final pubspec = loadYaml(content);
    final figmaImporter = pubspec['figma_importer'] as List<dynamic>?;
    if (figmaImporter == null) {
      throw Exception('figma_importer not found in pubspec.yaml');
    }

    final options =
        figmaImporter.map<FigmaImporterOptions>((entry) {
          final imageMapEntries =
              (entry['images'] as List<dynamic>)
                  .cast<YamlMap>()
                  .map(
                    (e) => MapEntry<String, String>(
                      e['nodeId']!,
                      e['destination']!,
                    ),
                  )
                  .cast<MapEntry<String, String>>();

          return FigmaImporterOptions(
            fileKey: entry['fileKey'],
            imageMap: Map.fromEntries(imageMapEntries),
          );
        }).toList();

    return options;
  }
}

class FigmaImporterOptions {
  const FigmaImporterOptions({required this.fileKey, required this.imageMap});

  /// Figma file key
  final String fileKey;

  /// Map of Figma node ID to destination file path
  final Map<String, String> imageMap;

  @override
  String toString() => 'fileKey: $fileKey, imageMap: $imageMap';
}
