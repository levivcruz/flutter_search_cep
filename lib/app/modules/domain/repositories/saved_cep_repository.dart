import 'package:either_dart/either.dart';

import '../../infra/models/cep_model.dart';

abstract class SavedCepRepository {
  Future<Either<Exception, int>> insert(Map<String, dynamic> model);

  Future<Either<Exception, List<CepModel>>> find();

  Future<Either<Exception, int>> delete(int id);
}
