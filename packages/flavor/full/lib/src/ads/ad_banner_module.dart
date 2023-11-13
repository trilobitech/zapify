import 'package:banner_core/banner_core.dart';
import 'package:di_core/di_core.dart';

import 'ad_banner_bloc.dart';
import 'ad_banner_widget.dart';

void adModules() {
  registerFactory<BottomBannerWidget>(
    () => AdBannerWidget(),
  );

  registerFactory(
    () => AdBannerBloc(),
  );
}
