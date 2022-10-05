import 'package:sqflite/sqflite.dart';

import '../../../app.dart';

class SqliteHistoricImpl implements SqliteHistoric {
  // Nome da tabela
  static const String _table = 'tb_historic';

  // Nome da coluna da tabela
  static const String _columnId = 'id';
  static const String _columnCep = 'cep';
  static const String _columnStreet = 'street';
  static const String _columnComplement = 'complement';
  static const String _columnCity = 'city';
  static const String _columnUf = 'uf';

  static const String createTableHistoric =
      "CREATE TABLE IF NOT EXISTS $_table("
      "$_columnId INTEGER PRIMARY KEY AUTOINCREMENT,"
      "$_columnCep TEXT NOT NULL,"
      "$_columnStreet TEXT NOT NULL,"
      "$_columnComplement TEXT,"
      "$_columnCity TEXT NOT NULL,"
      "$_columnUf TEXT NOT NULL"
      ");";

  @override
  Future<SqliteResponse> delete({required int id}) async {
    Database database = await SqliteConnectionImpl.instance.database;
    final int result = await database.delete(
      _table,
      where: '$_columnId = ?',
      whereArgs: [id],
    );

    return SqliteResponse(data: result, response: true);
  }

  @override
  Future<SqliteResponse> insert({required Map<String, dynamic> model}) async {
    Database database = await SqliteConnectionImpl.instance.database;
    final int result = await database.insert(_table, model);

    return SqliteResponse(data: result, response: true);
  }

  @override
  Future<SqliteResponse> find({Map<String, dynamic>? parameter}) async {
    Database database = await SqliteConnectionImpl.instance.database;

    String sql = '''
    SELECT * FROM $_table DESC
    ''';

    final List<Map<String, dynamic>> result = await database.rawQuery(sql);

    return SqliteResponse(data: result, response: true);
  }
}
