import 'package:zapfy/core/di/definition.dart';
import 'package:zapfy/core/di/inject.dart';
import 'package:zapfy/features/history/domain/usecase/get_phone_number_history.dart';
import 'package:zapfy/features/history/presentation/history_controller.dart';

void historyModule() {
  registerFactory(
    () => HistoryController(
      getPhoneNumberHistory: get(),
    ),
  );

  registerFactory(
    () => GetPhoneNumberHistoryUseCase(
      repository: get(),
    ),
  );
}