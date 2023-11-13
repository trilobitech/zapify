library zapify_flavor;

import 'package:flavor_core/flavor_core.dart';

import 'src/logger.dart';
import 'src/module.dart';

class ZapifyFlavorInitializer extends IFlavorInitializer {
  @override
  Future<void> init() async {
    logger.config('Initializing flavor');

    loadModules();
  }
}
