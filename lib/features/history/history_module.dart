import '../../common/di/definition.dart';
import 'data/repository/history_repository.dart';
import 'domain/repository/history_repository.dart';
import 'domain/usecase/get_phone_number_history.dart';
import 'domain/usecase/remove_phone_number_history.dart';
import 'domain/usecase/restore_phone_number_history.dart';
import 'domain/usecase/save_phone_number_history.dart';
import 'presentation/history_bloc.dart';

void historyModule() {
  registerFactory(
    () => HistoryBloc(
      getPhoneNumberHistory: get(),
      removePhoneNumberHistory: get(),
      restorePhoneNumberHistory: get(),
      analytics: get(),
    ),
  );

  registerFactory(
    () => GetPhoneNumberHistoryUseCase(
      repository: get(),
    ),
  );

  registerFactory(
    () => RemovePhoneNumberHistoryUseCase(
      repository: get(),
    ),
  );

  registerFactory(
    () => RestorePhoneNumberHistoryUseCase(
      repository: get(),
    ),
  );

  registerFactory(
    () => SavePhoneNumberHistoryUseCase(
      repository: get(),
    ),
  );

  registerSingleton<IHistoryRepository>(
    () => HistoryRepository(
      db: lazy(),
    ),
  );
}
