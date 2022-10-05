import 'package:either_dart/either.dart';

import '../../../app.dart';

abstract class GetCepRepository {
  Future<Either<FailureRequest, CepEntity>> call(String cepNumber);
}
