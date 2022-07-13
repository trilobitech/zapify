import 'package:zapfy/features/shared/domain/entity/history_entry.dart';
import 'package:zapfy/features/shared/domain/repository/history_repository.dart';

class SavePhoneNumberHistoryUseCase {
  SavePhoneNumberHistoryUseCase({
    required this.repository,
  });

  IHistoryRepository repository;

  Future call({
    required String phoneNumber,
  }) {
    final entry = HistoryEntry(
      phoneNumber: phoneNumber,
      at: DateTime.now(),
    );

    return repository.save(entry);
  }
}
