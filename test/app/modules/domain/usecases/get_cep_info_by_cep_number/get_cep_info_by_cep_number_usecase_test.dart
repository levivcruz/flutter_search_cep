import 'package:either_dart/either.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_search_cep/app/app.dart';

import '../../../../../mock/cep_mock.dart';

class GetCepRepositoryMock extends Mock implements GetCepRepository {}

void main() {
  late GetCepRepository repository;
  late GetCepInfoByCepNumberUsecase sut;
  late CepEntity cep;

  setUp(() {
    repository = GetCepRepositoryMock();
    sut = GetCepInfoByCepNumberUsecaseImpl(repository: repository);
    cep = CepMock.validCepEntity;
  });

  group('Get cep info by cep number usecase', () {
    success() {
      when(() => repository.call(CepMock.validCep))
          .thenAnswer((_) async => Right(cep));
    }

    fail(FailureRequest error) {
      when(() => repository.call(CepMock.validCep))
          .thenAnswer((_) async => Left(error));
    }

    test('Should be return a valid CepEntity', () async {
      success();
      final result = await sut.call(CepMock.validCep);
      expect(result.right, isA<CepEntity>());
      expect(result.right, cep);
      expect(result.isRight, true);
      verify(() => repository.call(CepMock.validCep)).called(1);
    });

    test('Should be return a FailureRequest', () async {
      fail(const FailureRequest(message: 'Error'));
      final result = await sut.call(CepMock.validCep);
      expect(result.left, isA<FailureRequest>());
      expect(result.left, const FailureRequest(message: 'Error'));
      expect(result.isLeft, true);
      verify(() => repository.call(CepMock.validCep)).called(1);
    });

    test('Should be return a Exception when cep is empty', () async {
      final result = await sut.call('');
      expect(result.left, isA<Exception>());
      expect(result.isLeft, true);
    });
  });
}
