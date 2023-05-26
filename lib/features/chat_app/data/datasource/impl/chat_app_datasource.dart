import 'package:logger_plus/logger_plus.dart';
import 'package:rxdart/subjects.dart';
import 'package:sqlbrite/sqlbrite.dart';

import '../../../../../common/di/lazy.dart';
import '../../../domain/entity/chat_app.dart';
import '../../model/chat_app.dart';
import '../chat_app_datasource.dart';

class ChatAppDataSource extends IChatAppDataSource {
  ChatAppDataSource({
    required Lazy<BriteDatabase> db,
  }) : _db = db.get() {
    _init();
  }

  final Future<BriteDatabase> _db;
  // ignore: close_sinks
  late final BehaviorSubject<List<ChatAppModel>> _actions = BehaviorSubject();

  void _init() {
    Stream.fromFuture(_db)
        .asyncExpand(
          (db) => db.createRawQuery(
            ['chat_app', 'enabled_chat_app'],
            '''
            SELECT
              a.id, a.name, a.icon, a.brand_color, a.deeplink_template,
              b.position, b.position IS NOT NULL as is_enabled
            FROM chat_app AS a
            LEFT OUTER JOIN enabled_chat_app AS b ON b.chat_app_id = a.id
            ORDER BY is_enabled DESC, b.position ASC, a.id ASC
            ''',
          ),
        )
        .mapToList(ChatAppModel.fromJson)
        .listen(_actions.add, onError: Log.e);
  }

  @override
  Stream<List<ChatAppModel>> get() => _actions.stream;

  @override
  Future<void> add(ChatApp chatApp) async {
    final db = await _db;
    await db.rawInsertAndTrigger(
      ['enabled_chat_app'],
      '''
      INSERT INTO enabled_chat_app (chat_app_id, position)
      VALUES (?, (SELECT IFNULL(MAX(position), 0) + 1 FROM enabled_chat_app))
      ''',
      [chatApp.id],
    );
  }

  @override
  Future<void> remove(ChatApp chatApp) async {
    final db = await _db;
    await db.delete(
      'enabled_chat_app',
      where: 'chat_app_id = ?',
      whereArgs: [chatApp.id],
    );
  }
}
