import '../../di/definition.dart';
import 'components/ad_banner/ad_banner_module.dart';
import 'components/chat_apps/chat_apps_module.dart';
import 'components/phone/phone_field_module.dart';
import 'components/top_banner/top_banner_module.dart';
import 'presentation/home_bloc.dart';

void homeModule() {
  registerFactory<HomeBloc>(
    () => HomeBloc(
      phoneFieldComponent: get(),
      savePhoneNumberHistory: get(),
    ),
  );

  phoneFiledModule();
  chatAppsModule();
  adBannerModule();
  topBannerModule();
}
