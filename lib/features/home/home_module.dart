import 'package:di_core/di_core.dart';

import 'chat_apps/chat_apps_module.dart';
import 'main/home_bloc.dart';
import 'phone/phone_field_module.dart';

void homeModule() {
  registerFactory<HomeBloc>(
    () => HomeBloc(
      phoneFieldComponent: get(),
      savePhoneNumberHistory: get(),
      analytics: get(),
    ),
  );

  phoneFiledModule();
  chatAppsModule();
}
