import '../../common/di/definition.dart';
import 'ad_banner/ad_banner_module.dart';
import 'chat_apps/chat_apps_module.dart';
import 'main/home_bloc.dart';
import 'phone/phone_field_module.dart';
import 'top_banner/top_banner_module.dart';

void homeModule() {
  registerFactory<HomeBloc>(
    () => HomeBloc(phoneFieldComponent: get(), savePhoneNumberHistory: get(), analytics: get()),
  );

  phoneFiledModule();
  chatAppsModule();
  adBannerModule();
  topBannerModule();
}
