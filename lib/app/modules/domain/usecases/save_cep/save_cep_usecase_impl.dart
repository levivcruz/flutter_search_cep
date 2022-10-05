import 'package:either_dart/either.dart';

import '../../../../app.dart';

class SaveCepUsecaseImpl implements SaveCepUsecase {
  final SavedCepRepository _repository;

  SaveCepUsecaseImpl({required SavedCepRepository repository})
      : _repository = repository;

  @override
  Future<Either<Exception, int>> call(CepEntity entity) async {
    if (entity.cep.isEmpty) {
      return Left(Exception('CEP is null'));
    }

    final result = await _repository.insert(CepModel.toJson(entity));

    if (result.isLeft) {
      return Left(result.left);
    }

    return Right(result.right);
  }
}
