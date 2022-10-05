import 'package:either_dart/either.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_search_cep/app/app.dart';

import '../../../../../mock/cep_mock.dart';

class SavedCepRepositoryMock extends Mock implements SavedCepRepository {}

void main() {
  late SavedCepRepository repository;
  late SaveCepUsecase sut;
  late Map<String, dynamic> remoteCepJson;
  late CepEntity cepEntity;

  setUp(() {
    repository = SavedCepRepositoryMock();
    sut = SaveCepUsecaseImpl(repository: repository);
    remoteCepJson = CepMock.validLocalCepJson;
    cepEntity = CepMock.validCepEntity;
  });
  group('Insert save cep usecase', () {
    success() {
      when(() => repository.insert(remoteCepJson))
          .thenAnswer((_) async => const Right(1));
    }

    fail(Exception error) {
      when(() => repository.insert(remoteCepJson))
          .thenAnswer((_) async => Left(error));
    }

    test('Should be return a valid int', () async {
      success();
      final result = await sut.call(cepEntity);
      expect(result.isRight, true);
      verify(() => repository.insert(remoteCepJson)).called(1);
    });
    test('Should be return an Exception', () async {
      fail(Exception('Error'));
      final result = await sut.call(cepEntity);
      expect(result.left, isA<Exception>());
      expect(result.isLeft, true);
    });

    test('Should be return an Exception when cep is null', () async {
      final result = await sut.call(CepMock.emptyCepEntity);
      expect(result.left, isA<Exception>());
      expect(result.isLeft, true);
    });
  });
}
