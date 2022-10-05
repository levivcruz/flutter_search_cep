import 'package:either_dart/either.dart';

import '../../../app.dart';

class GetCepRepositoryImpl implements GetCepRepository {
  final RemoteCepDatasource _datasource;

  GetCepRepositoryImpl({required RemoteCepDatasource datasource})
      : _datasource = datasource;

  @override
  Future<Either<FailureRequest, CepEntity>> call(String cepNumber) async {
    final result = await _datasource.getCepInfoByCepNumber(cepNumber);
    if (result.isLeft) {
      return Left(result.left);
    } else if (result.right.data.toString().contains('erro') &&
        CepErrorModel.fromJson(result.right.data).error == 'true') {
      return const Left(FailureRequest(message: 'CEP not found'));
    } else {
      final cep = CepModel.fromJson(result.right.data);

      final cepModelToEntity = CepEntity.fromModel(cep);

      return Right(cepModelToEntity);
    }
  }
}
