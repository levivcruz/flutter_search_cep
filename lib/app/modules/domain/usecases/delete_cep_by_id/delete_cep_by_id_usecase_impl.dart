import 'package:either_dart/either.dart';

import '../../../../app.dart';

class DeleteCepByIdUsecaseImpl implements DeleteCepByIdUsecase {
  final SavedCepRepository _repository;

  DeleteCepByIdUsecaseImpl({required SavedCepRepository repository})
      : _repository = repository;

  @override
  Future<Either<Exception, void>> call(int id) async {
    if (id < 1) {
      return Left(Exception('Invalid ID'));
    }

    final result = await _repository.delete(id);

    return result.isLeft ? Left(result.left) : const Right(null);
  }
}
