import 'dart:async';

import 'domain/entity/region.dart';

abstract class RegionMediator {
  void showRegionPicker(RegionCode? selectedCode);

  FutureOr<void> onRegionSelected(IRegion region);
}
