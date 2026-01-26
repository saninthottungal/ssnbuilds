import 'package:database/database.dart';

void main(List<String> args) async {
  final db = await AppDatabase.create(
    'postgresql://postgres.xlscsffybfgwlqbgxdsq:pixelSupabase564@aws-1-ap-south-1.pooler.supabase.com:6543/postgres',
  );
  db.getAllMessages();
}
