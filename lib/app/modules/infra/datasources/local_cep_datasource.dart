import 'package:either_dart/either.dart';

import '../models/cep_model.dart';

abstract class LocalCepDatasource {
  Future<Either<Exception, List<CepModel>>> find(
      {Map<String, dynamic>? parameter});
  Future<Either<Exception, int>> insert({required Map<String, dynamic> model});
  Future<Either<Exception, int>> delete({required int id});
}
