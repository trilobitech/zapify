import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  return openDatabase(
    join(await getDatabasesPath(), 'zapfy.db'),
    version: 1,
    onCreate: (db, version) {
      return db.execute(
        '''
        CREATE TABLE historic(
          number TEXT PRIMARY KEY,
          created_at TIMESTAMP DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL,
          last_usage_at TIMESTAMP
        );
        ''',
      );
    },
  );
}
