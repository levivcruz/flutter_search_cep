import 'package:either_dart/either.dart';

abstract class DeleteCepByIdUsecase {
  Future<Either<Exception, void>> call(int id);
}
