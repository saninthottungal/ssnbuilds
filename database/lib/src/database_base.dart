import 'package:postgres/postgres.dart';
import 'package:shared/shared.dart';

class AppDatabase {
  AppDatabase({required Connection connection}) : _conn = connection;
  final Connection _conn;

  static Future<AppDatabase> create(String connectionString) async {
    final conn = await Connection.openFromUrl(connectionString);
    return AppDatabase(connection: conn);
  }

  Future<List<AppMessage>> getAllMessages() async {
    final res = await _conn.execute("SELECT * FROM messages;");

    return res.map((e) => AppMessage.fromJson(e.toColumnMap())).toList();
  }

  Future<void> addMessage(AppMessage message) async {
    await _conn.execute(
      r'''
INSERT INTO messages 
(
name,
message,
email
) 
VALUES 
(
$1,
$2,
$3
);
''',
      parameters: [message.name, message.message, message.email],
    );
  }
}
