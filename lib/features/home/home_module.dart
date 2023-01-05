import '../../core/di/definition.dart';
import '../../core/di/inject.dart';
import 'presentation/home_bloc.dart';

void homeModule() {
  registerFactory<HomeBloc>(
    () => HomeBloc(
      phoneFieldComponent: get(),
      savePhoneNumberHistory: get(),
    ),
  );
}
