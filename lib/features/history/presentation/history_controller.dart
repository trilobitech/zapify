import '../../../config/local_config.dart';
import '../../shared/domain/entity/history_entry.dart';
import '../domain/usecase/get_phone_number_history.dart';
import '../domain/usecase/remove_phone_number_history.dart';
import '../domain/usecase/restore_phone_number_history.dart';
import 'history_state.dart';

class HistoryController {
  HistoryController({
    required this.getPhoneNumberHistory,
    required this.removePhoneNumberHistory,
    required this.restorePhoneNumberHistory,
  });

  final GetPhoneNumberHistoryUseCase getPhoneNumberHistory;
  final RemovePhoneNumberHistory removePhoneNumberHistory;
  final RestorePhoneNumberHistory restorePhoneNumberHistory;

  Stream<HistoryViewState> get state async* {
    final int historicSize = await LocalConfig.historicSize.get();

    yield historicSize > 0
        ? HistoryViewState.loading(historicSize)
        : HistoryViewState.empty();

    yield* getPhoneNumberHistory().map(_stateFor);
  }

  remove(HistoryEntry entry) {
    removePhoneNumberHistory(entry);
  }

  restore(HistoryEntry entry) {
    restorePhoneNumberHistory(entry);
  }

  HistoryViewState _stateFor(List<HistoryEntry> entries) {
    return entries.isNotEmpty
        ? HistoryViewState(entries: entries)
        : HistoryViewState.empty();
  }
}
