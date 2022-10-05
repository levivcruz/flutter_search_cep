import 'package:either_dart/either.dart';

import '../../../app.dart';

class LocalCepDatasourceImpl implements LocalCepDatasource {
  final SqliteHistoric _sqliteHistoric;

  LocalCepDatasourceImpl({required SqliteHistoric sqliteHistoric})
      : _sqliteHistoric = sqliteHistoric;

  @override
  Future<Either<Exception, int>> delete({required int id}) async {
    final result = await _sqliteHistoric.delete(id: id);
    if (result.response) {
      return Right(result.data);
    } else {
      return Left(Exception('Error deleting save cep'));
    }
  }

  @override
  Future<Either<Exception, List<CepModel>>> find(
      {Map<String, dynamic>? parameter}) async {
    final result = await _sqliteHistoric.find();

    if (result.response) {
      List<Map<String, dynamic>> saves = result.data;
      return Right(saves.map((cep) => CepModel.fromMap(cep)).toList());
    } else {
      return Left(Exception('Error fetching saves cep list'));
    }
  }

  @override
  Future<Either<Exception, int>> insert(
      {required Map<String, dynamic> model}) async {
    final result = await _sqliteHistoric.insert(model: model);
    if (result.response) {
      return Right(result.data);
    } else {
      return Left(Exception('Error inserting save cep'));
    }
  }
}
