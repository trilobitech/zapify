import '../../../../common/di/definition.dart';
import 'phone_field_component.dart';
import 'presentation/phone_field_bloc.dart';

void phoneFiledModule() {
  PhoneFieldBloc? instance;

  registerFactory<PhoneFieldComponent>(
    () => get<PhoneFieldBloc>(),
  );

  registerFactory(
    () => instance ??= PhoneFieldBloc(
      get(),
      getDefaultRegion: get(),
    ),
  );
}
