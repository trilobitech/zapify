import '../../core/di/definition.dart';
import '../../core/di/inject.dart';
import 'domain/usecase/get_phone_number_history.dart';
import 'domain/usecase/remove_phone_number_history.dart';
import 'domain/usecase/restore_phone_number_history.dart';
import 'presentation/history_controller.dart';

void historyModule() {
  registerFactory(
    () => HistoryController(
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
