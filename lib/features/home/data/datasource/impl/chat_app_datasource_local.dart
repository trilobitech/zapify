import 'package:collection/collection.dart';
import 'package:sqlbrite/sqlbrite.dart';
import 'package:zapify/core/logger.dart';
import 'package:zapify/features/home/data/datasource/chat_app_datasource.dart';
import 'package:zapify/features/home/data/model/chat_app_local.dart';
import 'package:zapify/features/home/domain/entity/chat_app.dart';

class ChatAppDataSourceLocalImpl implements ChatAppDataSourceLocal {
  ChatAppDataSourceLocalImpl({
    required this.db,
  });

  final Future<BriteDatabase> db;
  late final Stream<List<ChatAppLocal>> _chatApps = Stream.fromFuture(db)
      .asyncExpand((db) => db
          .createQuery('chat_app', orderBy: 'id ASC')
          .mapToList(ChatAppLocal.fromJson))
      .asBroadcastStream();

  @override
  Stream<List<ChatAppLocal>> get() => _chatApps;

  @override
  Future<void> syncWith(List<ChatApp> chatApps) async {
    final actual = await _chatApps.first;

    final updated = chatApps
        .mapIndexed(ChatAppLocal.fromEntity)
        .whereNot((element) => actual.contains(element));

    if (updated.isNotEmpty || actual.length > chatApps.length) {
      await _update(updated, chatApps);
    }
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
