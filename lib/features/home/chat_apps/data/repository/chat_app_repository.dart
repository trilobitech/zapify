import 'dart:async';

import '../../domain/entity/chat_app.dart';
import '../../domain/repository/chat_app_repository.dart';
import '../datasource/chat_app_datasource.dart';

class ChatAppRepository implements IChatAppRepository {
  ChatAppRepository({
    required this.dataSource,
  });

  final ChatAppDataSource dataSource;

  @override
  Stream<List<ChatApp>> getAll() => dataSource.get();
}
