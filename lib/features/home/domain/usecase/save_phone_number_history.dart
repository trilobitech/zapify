import '../../../shared/domain/repository/history_repository.dart';

class SavePhoneNumberHistoryUseCase {
  SavePhoneNumberHistoryUseCase({
    required this.repository,
  });

  IHistoryRepository repository;

  Future call({
    required String phoneNumber,
  }) {
    return repository.add(phoneNumber);
  }
}
