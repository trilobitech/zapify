import 'package:logify/logify.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final dbPath = join(await getDatabasesPath(), 'zapfy.db');
  return openDatabase(
    dbPath,
    version: _migrationsUp.length,
    onCreate: (db, version) => _migrateUp(db, 0, version),
    onUpgrade: _migrateUp,
    onDowngrade: _migrateDown,
  );
}

Future<void> _migrateUp(Database db, int oldVersion, int newVersion) async {
  final migrations = _migrationsUp.sublist(oldVersion, newVersion);

  await _migrate(
    db,
    migrations: migrations,
    oldVersion: oldVersion,
    newVersion: newVersion,
  );
}

Future<void> _migrateDown(Database db, int oldVersion, int newVersion) async {
  final migrations = _migrationsDown.sublist(newVersion, oldVersion).reversed;

  await _migrate(
    db,
    migrations: migrations,
    oldVersion: oldVersion,
    newVersion: newVersion,
  );
}

Future<void> _migrate(
  Database db, {
  required Iterable<String> migrations,
  required int oldVersion,
  required int newVersion,
}) async {
  try {
    final batch = db.batch();

    migrations
        .expand((e) => e.split(';'))
        .map((e) => e.trim())
        .where((sql) => sql.isNotEmpty)
        .forEach((sql) => batch.execute(sql));

    await batch.commit(noResult: true);
    Log.i(
      'Successful to run database migration from $oldVersion to $newVersion',
    );
  } catch (e, stack) {
    Log.e(
      'Failed to create or migrate database from $oldVersion to $newVersion',
      e,
      stack,
    );
  }
}

List<String> get _migrationsUp => [
  '''
    CREATE TABLE historic(
      number TEXT PRIMARY KEY,
      created_at TIMESTAMP DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL,
      last_usage_at TIMESTAMP
    )
  ''',
  '''
    CREATE TABLE chat_app(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      icon TEXT,
      brand_color TEXT,
      deeplink_prefix TEXT
    );

    INSERT INTO chat_app(id, name, icon, brand_color, deeplink_prefix) VALUES
    (0, 'WhatsApp', 'assets://icons/whatsapp.svg', '#ff25d366', 'https://wa.me/'),
    (1, 'Telegram', 'assets://icons/telegram.svg', '#ff0088cc', 'https://t.me/'),
    (2, 'Signal',   'assets://icons/signal.svg',   '#ff3a76f0', 'https://signal.me/#p/+')
  ''',
  '''
    DROP TABLE IF EXISTS chat_app;

    CREATE TABLE chat_app(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      icon TEXT,
      brand_color TEXT,
      deeplink_template TEXT
    );

    INSERT INTO chat_app(id, name, icon, brand_color, deeplink_template) VALUES
    (0, 'WhatsApp',    'assets://icons/whatsapp.svg',          '#ff25d366', 'whatsapp-consumer://send?phone={phoneNumber}'),
    (1, 'WA Business', 'assets://icons/whatsapp-business.svg', '#ff25d366', 'whatsapp-smb://send?phone={phoneNumber}'),
    (2, 'Telegram',    'assets://icons/telegram.svg',          '#ff0088cc', 'https://t.me/{phoneNumber}'),
    (3, 'Signal',      'assets://icons/signal.svg',            '#ff3a76f0', 'https://signal.me/#p/+{phoneNumber}');
  ''',
  '''
    CREATE TABLE enabled_chat_app(
      chat_app_id INTEGER PRIMARY KEY,
      position INTEGER NOT NULL,
      FOREIGN KEY(chat_app_id) REFERENCES chat_app(id)
    );

    INSERT INTO enabled_chat_app(chat_app_id, position)
    SELECT id, id FROM chat_app;
  ''',
];

List<String> get _migrationsDown => [
  '''
    DROP TABLE IF EXISTS historic
  ''',
  '''
    DROP TABLE IF EXISTS chat_app
  ''',
  '''
    DROP TABLE IF EXISTS chat_app;

    CREATE TABLE chat_app(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      icon TEXT,
      brand_color TEXT,
      deeplink_prefix TEXT
    );
  ''',
  '''
    DROP TABLE IF EXISTS enabled_chat_app;
  ''',
];
