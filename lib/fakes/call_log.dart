import 'package:flutter/widgets.dart';

import '../app.dart';
import '../features/call_log/domain/entity/call.dart';
import '../features/call_log/domain/repository/call_log.dart';

final DateTime now = DateTime.now();

class CallLogRepositoryFake extends CallLogRepository {
  final Map<String, List<CallEntity>> _fakeCallHistory = {
    'pt': [
      CallEntity(
        name: 'Lucas Silva',
        number: '+55 11 90000-1234',
        date: now.subtract(const Duration(minutes: 7)),
        type: CallType.income,
      ),
      CallEntity(
        name: null,
        number: '+55 21 91234-5678',
        date: now.subtract(const Duration(minutes: 29)),
        type: CallType.missed,
      ),
      CallEntity(
        name: 'Maria Oliveira',
        number: '+55 31 90000-4321',
        date: now.subtract(const Duration(hours: 1, minutes: 8)),
        type: CallType.outcome,
      ),
      CallEntity(
        name: 'João Pereira',
        number: '+55 19 90000-8888',
        date: now.subtract(const Duration(hours: 7, minutes: 45)),
        type: CallType.rejected,
      ),
      CallEntity(
        name: null,
        number: '+55 85 90000-7777',
        date: now.subtract(const Duration(days: 1, hours: 2, minutes: 7)),
        type: CallType.blocked,
      ),
      CallEntity(
        name: 'Ana Souza',
        number: '+55 47 90000-9999',
        date: now.subtract(const Duration(days: 7, hours: 7, minutes: 51)),
        type: CallType.income,
      ),
      CallEntity(
        name: 'Carlos Mendes',
        number: '+55 92 90000-2222',
        date: now.subtract(const Duration(days: 14, hours: 13, minutes: 39)),
        type: CallType.outcome,
      ),
      CallEntity(
        name: null,
        number: '+55 61 90000-5555',
        date: now.subtract(const Duration(days: 45, hours: 22, minutes: 58)),
        type: CallType.missed,
      ),
    ],
    'en': [
      CallEntity(
        name: 'John Smith',
        number: '+1 555-987-6543',
        date: now.subtract(const Duration(minutes: 7)),
        type: CallType.income,
      ),
      CallEntity(
        name: null,
        number: '+1 646 123-4567',
        date: now.subtract(const Duration(minutes: 29)),
        type: CallType.missed,
      ),
      CallEntity(
        name: 'Emily Johnson',
        number: '+1 555-876-5432',
        date: now.subtract(const Duration(hours: 1, minutes: 8)),
        type: CallType.outcome,
      ),
      CallEntity(
        name: 'Michael Sinclair',
        number: '+1 555-555-8888',
        date: now.subtract(const Duration(hours: 7, minutes: 45)),
        type: CallType.rejected,
      ),
      CallEntity(
        name: null,
        number: '+1 503 666-7777',
        date: now.subtract(const Duration(days: 1, hours: 2, minutes: 7)),
        type: CallType.blocked,
      ),
      CallEntity(
        name: 'Sophia Williams',
        number: '+1 555-777-9999',
        date: now.subtract(const Duration(days: 7, hours: 7, minutes: 51)),
        type: CallType.income,
      ),
      CallEntity(
        name: 'David Miller',
        number: '+1 555-111-2222',
        date: now.subtract(const Duration(days: 14, hours: 13, minutes: 39)),
        type: CallType.outcome,
      ),
      CallEntity(
        name: null,
        number: '+1 555-444-5555',
        date: now.subtract(const Duration(days: 45, hours: 22, minutes: 58)),
        type: CallType.missed,
      ),
    ],
  };

  @override
  Future<Iterable<CallEntity>> getAll() async {
    final context = App.navigatorKey.currentContext!;
    final locale = Localizations.localeOf(context).languageCode;
    final fakeCallHistory = _fakeCallHistory[locale];

    if (fakeCallHistory == null) {
      throw Exception('No fake call history for locale: $locale');
    }

    return fakeCallHistory;
  }
}
