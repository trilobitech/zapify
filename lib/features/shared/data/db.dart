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

  await _migrate(db, migrations);
}

Future<void> _migrateDown(Database db, int oldVersion, int newVersion) async {
  final migrations = _migrationsDown.sublist(newVersion, oldVersion).reversed;

  await _migrate(db, migrations);
}

Future<void> _migrate(Database db, Iterable<String> migrations) async {
  final batch = db.batch();

  migrations
      .expand((e) => e.split(';'))
      .where((sql) => sql.trim().isNotEmpty)
      .forEach((sql) => batch.execute(sql));

  await batch.commit(noResult: true);
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
      INSERT INTO chat_app(name, icon, brand_color, deeplink_prefix) VALUES
      ("WhatsApp", "assets://icons/whatsapp.svg", "#ff25d366", "https://wa.me/"),
      ("Telegram", "assets://icons/telegram.svg", "#ff0088cc", "https://t.me/"),
      ("Signal",   "assets://icons/signal.svg",   "#ff3a76f0", "https://signal.me/#p/+")
      ''',
    ];

List<String> get _migrationsDown => [
      '''
      DROP TABLE IF EXISTS historic
      ''',
      '''
      DROP TABLE IF EXISTS chat_app
      ''',
    ];
