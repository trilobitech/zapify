import 'domain/entity/region.dart';

abstract class RegionMediator {
  void showRegionPicker(Region region);

  void onRegionSelected(Region region);
}
