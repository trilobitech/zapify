import 'dart:async';

import 'package:collection/collection.dart';
import 'package:rxdart/rxdart.dart';

import '../features/history/domain/entity/history.dart';
import '../features/history/domain/repository/history_repository.dart';

final DateTime now = DateTime.now();

class HistoryRepositoryFake implements IHistoryRepository {
  final List<HistoryEntry> _fakeHistoryEntries = [
    HistoryEntry(
      phoneNumber: '+55 11 90000-5678', // Brasil
      lastUsageAt: now,
    ),
    HistoryEntry(
      phoneNumber: '+34 91 123 0000', // Espanha
      lastUsageAt: now.subtract(const Duration(minutes: 3)),
    ),
    HistoryEntry(
      phoneNumber: '+1 555-987-6543', // EUA
      lastUsageAt: now.subtract(const Duration(minutes: 17)),
    ),
    HistoryEntry(
      phoneNumber: '+49 30 12340000', // Alemanha
      lastUsageAt: now.subtract(const Duration(hours: 1)),
    ),
    HistoryEntry(
      phoneNumber: '+33 1 23 45 00 00', // França
      lastUsageAt: now.subtract(const Duration(hours: 2)),
    ),
    HistoryEntry(
      phoneNumber: '+81 3-1234-0000', // Japão
      lastUsageAt: now.subtract(const Duration(days: 1)),
    ),
    HistoryEntry(
      phoneNumber: '+61 2 9876 0000', // Austrália
      lastUsageAt: now.subtract(const Duration(days: 7)),
    ),
    HistoryEntry(
      phoneNumber: '+91 22 1234 0000', // Índia
      lastUsageAt: now.subtract(const Duration(days: 45)),
    ),
    HistoryEntry(
      phoneNumber: '+27 21 555 0000', // África do Sul
      lastUsageAt: now.subtract(const Duration(days: 90)),
    ),
    HistoryEntry(
      phoneNumber: '+44 20 7946 0000', // Reino Unido
      lastUsageAt: now.subtract(const Duration(days: 365)),
    ),
  ];

  late final Subject<List<HistoryEntry>> _subject =
      BehaviorSubject()..add(_fakeHistoryEntries);

  @override
  Stream<List<HistoryEntry>> getAll() => _subject.stream;

  @override
  Future<void> add(String phoneNumber) async {
    final entry = HistoryEntry(
      phoneNumber: phoneNumber,
      lastUsageAt: DateTime.now(),
    );
    final historyEntries = (await _subject.first) + [entry];
    _subject.add(historyEntries);
  }

  @override
  Future<void> remove(HistoryEntry entry) async {
    final historyEntries =
        (await _subject.first)
            .whereNot((e) => e.phoneNumber == entry.phoneNumber)
            .toList();
    _subject.add(historyEntries);
  }

  @override
  Future<void> restore(HistoryEntry entry) async {
    final historyEntries = ((await _subject.first) + [entry]).sortedByCompare(
      (e) => e.lastUsageAt,
      (a, b) => b.compareTo(a),
    );
    _subject.add(historyEntries);
  }
}
