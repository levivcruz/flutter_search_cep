import 'package:either_dart/either.dart';

import '../../entities/cep_entity.dart';

abstract class SaveCepUsecase {
  Future<Either<Exception, int>> call(CepEntity entity);
}
