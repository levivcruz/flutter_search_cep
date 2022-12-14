import 'package:either_dart/either.dart';

import '../../entities/cep_entity.dart';

abstract class FindSavedCepUsecase {
  Future<Either<Exception, List<CepEntity>>> call();
}
