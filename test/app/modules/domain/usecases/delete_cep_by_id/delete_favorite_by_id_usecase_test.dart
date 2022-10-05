import 'package:either_dart/either.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_search_cep/app/app.dart';

class SavedCepRepositoryMock extends Mock implements SavedCepRepository {}

void main() {
  late SavedCepRepository repository;
  late DeleteCepByIdUsecase sut;

  setUp(() {
    repository = SavedCepRepositoryMock();
    sut = DeleteCepByIdUsecaseImpl(repository: repository);
  });

  group('Delete save cep by id usecase', () {
    success() {
      when(() => repository.delete(1)).thenAnswer((_) async => const Right(1));
    }

    fail(Exception error) {
      when(() => repository.delete(1)).thenAnswer((_) async => Left(error));
    }

    test('Should be return a valid void', () async {
      success();
      final result = await sut.call(1);
      expect(result.isRight, true);
      verify(() => repository.delete(1)).called(1);
    });
    test('Should be return an Exception', () async {
      fail(Exception('Error'));
      final result = await sut.call(1);
      expect(result.left, isA<Exception>());
      expect(result.isLeft, true);
    });

    test('should be return an Exception when id is invalid', () async {
      final result = await sut.call(0);
      expect(result.left, isA<Exception>());
      expect(result.isLeft, true);
    });
  });
}
