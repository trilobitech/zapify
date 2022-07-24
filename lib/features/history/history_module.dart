import 'package:zapify/config/local_config.dart';
import 'package:zapify/core/di/definition.dart';
import 'package:zapify/core/di/inject.dart';
import 'package:zapify/features/history/domain/usecase/get_phone_number_history.dart';
import 'package:zapify/features/history/domain/usecase/remove_phone_number_history.dart';
import 'package:zapify/features/history/domain/usecase/restore_phone_number_history.dart';
import 'package:zapify/features/history/presentation/history_controller.dart';

void historyModule() {
  registerFactory(
    () => HistoryController(
      getPhoneNumberHistory: get(),
      removePhoneNumberHistory: get(),
      restorePhoneNumberHistory: get(),
      historicSize: LocalConfig.historicSize.get(),
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
