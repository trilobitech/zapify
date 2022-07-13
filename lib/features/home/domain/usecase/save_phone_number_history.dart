import 'package:flutter/material.dart';
import 'package:zapfy/features/home/domain/entity/history_entry.dart';
import 'package:zapfy/features/home/domain/repository/history_repository.dart';

class SavePhoneNumberHistoryUseCase {
  SavePhoneNumberHistoryUseCase({
    required this.repository,
  });

  IHistoryRepository repository;

  Future call({
    required IconData appIcon,
    required String phoneNumber,
  }) {
    final entry = HistoryEntry(
      appIcon: appIcon,
      phoneNumber: phoneNumber,
      at: DateTime.now(),
    );

    return repository.save(entry);
  }
}
