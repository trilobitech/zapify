import 'package:collection/collection.dart';
import 'package:sqlbrite/sqlbrite.dart';
import 'package:zapify/core/logger.dart';
import 'package:zapify/features/home/data/datasource/chat_app_datasource.dart';
import 'package:zapify/features/home/data/model/chat_app_local.dart';
import 'package:zapify/features/home/domain/entity/chat_app.dart';
import 'package:rxdart/rxdart.dart';

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
        .listen(_chatApps.add, onError: logError);
  }

  @override
  Stream<List<ChatAppLocal>> get() => _chatApps;

  @override
  Future<void> syncWith(List<ChatApp> chatApps) async {
    final actual = await _chatApps.first;

    logDebug('Checking if received chat apps is different from local');
    final updated = chatApps
        .mapIndexed(ChatAppLocal.fromEntity)
        .whereNot((element) => actual.contains(element));

    if (updated.isEmpty && actual.length == chatApps.length) {
      logDebug('Chat apps not changed');
      return;
    }

    await _update(updated, chatApps);
    logDebug('Chat apps are now updated');
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
