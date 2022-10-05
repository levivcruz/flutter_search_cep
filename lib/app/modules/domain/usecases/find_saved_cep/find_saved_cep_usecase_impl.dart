import 'package:either_dart/either.dart';

import '../../entities/cep_entity.dart';
import '../../repositories/saved_cep_repository.dart';
import 'find_saved_cep_usecase.dart';

class FindSavedCepUsecaseImpl implements FindSavedCepUsecase {
  final SavedCepRepository _repository;

  FindSavedCepUsecaseImpl({required SavedCepRepository repository})
      : _repository = repository;

  @override
  Future<Either<Exception, List<CepEntity>>> call() async {
    final result = await _repository.find();

    if (result.isLeft) {
      return Left(result.left);
    }

    final data = result.right;
    return Right(data.map((entity) => CepEntity.fromModel(entity)).toList());
  }
}
