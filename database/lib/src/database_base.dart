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

    return res.map((e) {
      final map = e.toColumnMap();
      return AppMessage(
        id: map['id'] as int,
        name: map['name'] as String,
        message: map['message'] as String,
        createdAt: map['createdat'] as DateTime,
        email: map['email'],
      );
    }).toList();
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
