import 'package:collection/collection.dart';
import 'package:sqlbrite/sqlbrite.dart';
import 'package:zapify/features/home/data/datasource/chat_app_datasource.dart';
import 'package:zapify/features/home/domain/entity/chat_app.dart';

class ChatAppDataSourceLocalImpl implements ChatAppDataSourceLocal {
  ChatAppDataSourceLocalImpl({
    required this.db,
  });

  final Future<BriteDatabase> db;

  @override
  Stream<List<ChatApp>> get() async* {
    final db = await this.db;
    yield* db
        .createQuery('chat_app', orderBy: 'id ASC')
        .mapToList(ChatApp.fromJson);
  }

  @override
  Future<void> syncWith(List<ChatApp> chatApps) async {
    final db = await this.db;

    final batch = db.batch();
    chatApps.forEachIndexed((index, element) {
      batch.insert(
        'chat_app',
        {
          'id': index + 1,
          'name': element.name,
          'icon': element.icon.toString(),
          'brand_color': element.brandColor.toString(),
          'deeplink_prefix': element.deepLinkPrefix,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });

    batch.delete('chat_app', where: 'id > ${chatApps.length}');

    await batch.commit();
  }
}
