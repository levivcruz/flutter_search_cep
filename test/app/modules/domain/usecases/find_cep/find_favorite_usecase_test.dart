import 'package:either_dart/either.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_search_cep/app/app.dart';

import '../../../../../mock/cep_mock.dart';

class SavedCepRepositoryMock extends Mock implements SavedCepRepository {}

void main() {
  late SavedCepRepository repository;
  late FindSavedCepUsecase sut;
  late List<CepModel> remoteCep;
  late List<CepEntity> cepEntity;

  setUp(() {
    repository = SavedCepRepositoryMock();
    sut = FindSavedCepUsecaseImpl(repository: repository);
    remoteCep = CepMock.validRemoteCepModelList;
    cepEntity = remoteCep.map((entity) => CepEntity.fromModel(entity)).toList();
  });
  group('Find cep save usecase', () {
    success() {
      when(() => repository.find()).thenAnswer((_) async => Right(remoteCep));
    }

    fail(Exception error) {
      when(() => repository.find()).thenAnswer((_) async => Left(error));
    }

    test('Should be return a valid List of CepEntity', () async {
      success();
      final result = await sut.call();
      expect(result.right, isA<List<CepEntity>>());
      expect(result.right, cepEntity);
      expect(result.isRight, true);
      verify(() => repository.find()).called(1);
    });
    test('Should be return an Exception', () async {
      fail(Exception('Error'));
      final result = await sut.call();
      expect(result.left, isA<Exception>());
      expect(result.isLeft, true);
    });
  });
}
