import '../../core/di/definition.dart';
import '../../core/di/inject.dart';
import 'domain/usecase/get_phone_number_history.dart';
import 'domain/usecase/remove_phone_number_history.dart';
import 'domain/usecase/restore_phone_number_history.dart';
import 'presentation/history_bloc.dart';

void historyModule() {
  registerFactory(
    () => HistoryBloc(
      getPhoneNumberHistory: get(),
      removePhoneNumberHistory: get(),
      restorePhoneNumberHistory: get(),
    ),
  );

  registerFactory(
    () => GetPhoneNumberHistoryUseCase(
      repository: get(),
    ),
  );

  registerFactory(
    () => RemovePhoneNumberHistory(
      repository: get(),
    ),
  );

  registerFactory(
    () => RestorePhoneNumberHistory(
      repository: get(),
    ),
  );
}
