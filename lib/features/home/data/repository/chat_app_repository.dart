import 'package:logger_plus/logger_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zapify/config/local_config.dart';
import 'package:zapify/features/home/data/datasource/chat_app_datasource.dart';
import 'package:zapify/features/home/data/model/chat_app_remote.dart';
import 'package:zapify/features/home/domain/entity/chat_app.dart';
import 'package:zapify/features/home/domain/entity/color.dart';
import 'package:zapify/features/home/domain/repository/chat_app_repository.dart';

class ChatAppRepository implements IChatAppRepository {
  ChatAppRepository({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  final ChatAppDataSourceLocal localDataSource;
  final ChatAppDataSourceRemote remoteDataSource;

  @override
  Stream<List<ChatApp>> getAll() async* {
    final placeholder = ChatApp(
      icon: Uri.parse('assets://icons/whatsapp.svg'),
      name: 'WhatsApp',
      brandColor: Color(0xff25d366),
      deepLinkPrefix: 'https://wa.me/',
    );
    yield [placeholder];

    _syncWithRemoteIfNeeded();

    yield* localDataSource.get();
  }

  _syncWithRemoteIfNeeded() async {
    final now = DateTime.now().millisecond;
    const expiration = LocalConfig.chatAppsExpiration;
    final expiratedAt = await expiration.get<int>();

    if (now < expiratedAt) {
      Log.d('Cache is not expired, skipping sync');
      return;
    }

    Log.d('Cache is expired, syncing with remote');
    _syncWithRemote(expiration, now);
  }

  void _syncWithRemote(LocalConfig expiration, int now) {
    // TODO: use syncInterval from env variable
    final syncInterval = const Duration(days: 1).inMilliseconds;

    remoteDataSource
        .get()
        .then(_filterAvailableApps)
        .then(localDataSource.syncWith)
        .then((_) => expiration.set(now + syncInterval))
        .catchError(catchErrorLogger);
  }

  Future<List<ChatApp>> _filterAvailableApps(List<ChatAppRemote> apps) async {
    final validated = await Future.wait(apps.map(_validate));
    return validated.whereType<ChatApp>().toList();
  }

  Future<ChatApp?> _validate(ChatAppRemote app) async =>
      await _canLaunchApp(app) ? app : null;

  Future<bool> _canLaunchApp(ChatAppRemote app) async {
    if (app.requirePreVerification) {
      return await _canLaunchUrl(app.deepLinkPrefix);
    }

    return app.fallbackFor.fold(
      Future.value(true),
      (previousValue, url) async =>
          (await previousValue) & !(await _canLaunchUrl(url)),
    );
  }

  Future<bool> _canLaunchUrl(String url) => canLaunchUrl(Uri.parse(url));
}
