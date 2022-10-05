import 'package:either_dart/either.dart';

import '../../../app.dart';

class SavedCepRepositoryImpl implements SavedCepRepository {
  final LocalCepDatasource _datasource;

  SavedCepRepositoryImpl({required LocalCepDatasource datasource})
      : _datasource = datasource;

  @override
  Future<Either<Exception, int>> delete(int id) async {
    final result = await _datasource.delete(id: id);
    try {
      return Right(result.right);
    } on Exception {
      return Left(Exception('Failed to access datasource'));
    }
  }

  @override
  Future<Either<Exception, List<CepModel>>> find() async {
    final result = await _datasource.find();
    try {
      return Right(result.right);
    } on Exception {
      return Left(Exception('Failed to access datasource'));
    }
  }

  @override
  Future<Either<Exception, int>> insert(Map<String, dynamic> model) async {
    final result = await _datasource.insert(model: model);

    try {
      return Right(result.right);
    } on Exception {
      return Left(Exception('Failed to access datasource'));
    }
  }
}
