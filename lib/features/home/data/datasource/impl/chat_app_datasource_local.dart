import 'package:collection/collection.dart';
import 'package:logger_plus/logger_plus.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sqlbrite/sqlbrite.dart';

import '../../../domain/entity/chat_app.dart';
import '../../model/chat_app_local.dart';
import '../chat_app_datasource.dart';

class ChatAppDataSourceLocalImpl implements ChatAppDataSourceLocal {
  ChatAppDataSourceLocalImpl({
    required this.db,
  }) {
    _init();
  }

  final Future<BriteDatabase> db;
  late final BehaviorSubject<List<ChatAppLocal>> _chatApps;

  void _init() {
    _chatApps = BehaviorSubject();
    Stream.fromFuture(db)
        .asyncExpand((db) => db
            .createQuery('chat_app', orderBy: 'id ASC')
            .mapToList(ChatAppLocal.fromJson))
        .listen(_chatApps.add, onError: Log.e);
  }

  @override
  Stream<List<ChatAppLocal>> get() => _chatApps;

  @override
  Future<void> syncWith(List<ChatApp> chatApps) async {
    final actual = await _chatApps.first;

    Log.d('Checking if received chat apps is different from local');
    final updated = chatApps
        .mapIndexed(ChatAppLocal.fromEntity)
        .whereNot((element) => actual.contains(element));

    if (updated.isEmpty && actual.length == chatApps.length) {
      Log.d('Chat apps not changed');
      return;
    }

    await _update(updated, chatApps);
    Log.d('Chat apps are now updated');
  }

  Future<void> _update(
    Iterable<ChatAppLocal> updated,
    List<ChatApp> chatApps,
  ) async {
    final batch = (await db).batch();
    for (var element in updated) {
      batch.insert(
        'chat_app',
        element.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    batch.delete('chat_app', where: 'id >= ${chatApps.length}');

    await batch.commit();
  }
}
