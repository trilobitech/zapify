library zapify_flavor;

import 'package:flavor_core/flavor_core.dart';
import 'package:zapify_flavor/src/module.dart';

import 'src/logger.dart';

class ZapifyFlavorInitializer extends IFlavorInitializer {
  @override
  Future<void> init() async {
    logger.config('Initializing flavor');

    loadModules();
  }
}
