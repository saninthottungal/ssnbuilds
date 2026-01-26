import 'package:postgres/postgres.dart';

class AppDatabase {
  AppDatabase({required Connection connection}) : _conn = connection;
  final Connection _conn;

  static Future<AppDatabase> create(String connectionString) async {
    final conn = await Connection.openFromUrl(connectionString);
    return AppDatabase(connection: conn);
  }
}
