import 'package:zapfy/features/history/domain/usecase/get_phone_number_history.dart';
import 'package:zapfy/features/history/presentation/history_state.dart';

class HistoryController {
  HistoryController({
    required this.getPhoneNumberHistory,
  });

  final GetPhoneNumberHistoryUseCase getPhoneNumberHistory;

  late final Stream<HistoryViewState> state = getPhoneNumberHistory().map(
    (event) => event.isNotEmpty
        ? HistoryViewState(entries: event)
        : HistoryViewState.empty(),
  );
}
