import 'package:either_dart/either.dart';

import '../../../../app.dart';

class GetCepInfoByCepNumberUsecaseImpl implements GetCepInfoByCepNumberUsecase {
  final GetCepRepository _repository;

  GetCepInfoByCepNumberUsecaseImpl({required GetCepRepository repository})
      : _repository = repository;

  @override
  Future<Either<Exception, CepEntity>> call(String cepNumber) async {
    if (cepNumber.trim().isEmpty) {
      return Left(Exception('O CEP não pode estar vazio'));
    }
    final response = await _repository.call(cepNumber);

    if (response.isLeft) {
      return Left(response.left);
    } else {
      return Right(response.right);
    }
  }
}
