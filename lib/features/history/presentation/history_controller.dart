import 'package:zapfy/features/history/domain/usecase/get_phone_number_history.dart';
import 'package:zapfy/features/history/domain/usecase/remove_phone_number_history.dart';
import 'package:zapfy/features/history/domain/usecase/restore_phone_number_history.dart';
import 'package:zapfy/features/history/presentation/history_state.dart';
import 'package:zapfy/features/shared/domain/entity/history_entry.dart';

class HistoryController {
  HistoryController({
    required this.getPhoneNumberHistory,
    required this.removePhoneNumberHistory,
    required this.restorePhoneNumberHistory,
    required this.historicSize,
  });

  final GetPhoneNumberHistoryUseCase getPhoneNumberHistory;
  final RemovePhoneNumberHistory removePhoneNumberHistory;
  final RestorePhoneNumberHistory restorePhoneNumberHistory;
  final int historicSize;

  late final Stream<HistoryViewState> state =
      getPhoneNumberHistory().map(_stateFor);

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
