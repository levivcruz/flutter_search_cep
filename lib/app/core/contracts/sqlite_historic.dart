import '../responses/sqlite_response.dart';

abstract class SqliteHistoric {
  Future<SqliteResponse> find({Map<String, dynamic>? parameter});
  Future<SqliteResponse> insert({required Map<String, dynamic> model});
  Future<SqliteResponse> delete({required int id});
}
