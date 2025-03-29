import '../../../../common/di/definition.dart';
import 'presentation/ad_banner_bloc.dart';

void adBannerModule() {
  registerFactory(() => AdBannerBloc());
}
