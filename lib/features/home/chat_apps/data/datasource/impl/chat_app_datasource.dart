import 'package:logger_plus/logger_plus.dart';
import 'package:rxdart/subjects.dart';
import 'package:sqlbrite/sqlbrite.dart';

import '../../../../../../common/di/lazy.dart';
import '../../model/chat_app_local.dart';
import '../chat_app_datasource.dart';

class ChatAppDataSourceImpl implements ChatAppDataSource {
  ChatAppDataSourceImpl({
    required Lazy<BriteDatabase> db,
  }) : _db = db.get() {
    _init();
  }

  final Future<BriteDatabase> _db;
  // ignore: close_sinks
  late final BehaviorSubject<List<ChatAppLocal>> _chatApps = BehaviorSubject();

  void _init() {
    Stream.fromFuture(_db)
        .asyncExpand((db) => db.createQuery('chat_app', orderBy: 'id ASC'))
        .mapToList(ChatAppLocal.fromJson)
        .listen(_chatApps.add, onError: Log.e);
  }

  @override
  Stream<List<ChatAppLocal>> get() => _chatApps.stream;
}
