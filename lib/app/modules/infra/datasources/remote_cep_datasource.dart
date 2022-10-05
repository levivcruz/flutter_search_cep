import 'package:either_dart/either.dart';

import '../../../app.dart';

abstract class RemoteCepDatasource {
  Future<Either<FailureRequest, HttpResponse>> getCepInfoByCepNumber(
      String cepNumber);
}
