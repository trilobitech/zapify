import 'package:zapfy/core/di/definition.dart';
import 'package:zapfy/features/shared/data/repository/history_repository.dart';
import 'package:zapfy/features/shared/domain/repository/history_repository.dart';

void sharedModule() {
  registerSingleton<IHistoryRepository>(
    () => HistoryRepository(),
  );
}
