import 'package:either_dart/either.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_search_cep/app/app.dart';

import '../../../../../../mock/cep_mock.dart';

class FindSavedCepUsecaseMock extends Mock implements FindSavedCepUsecase {}

class DeleteCepByIdUsecaseMock extends Mock implements DeleteCepByIdUsecase {}

class SaveCepUsecaseMock extends Mock implements SaveCepUsecase {}

class GetCepInfoByCepNumberUsecaseMock extends Mock
    implements GetCepInfoByCepNumberUsecase {}

void main() {
  late FindSavedCepUsecase findSavedCepUsecase;
  late DeleteCepByIdUsecase deleteCepByIdUsecase;
  late SaveCepUsecase saveCepUsecase;
  late GetCepInfoByCepNumberUsecase getCepInfoByCepNumber;
  late SearchController sut;
  setUp(() {
    findSavedCepUsecase = FindSavedCepUsecaseMock();
    deleteCepByIdUsecase = DeleteCepByIdUsecaseMock();
    saveCepUsecase = SaveCepUsecaseMock();
    getCepInfoByCepNumber = GetCepInfoByCepNumberUsecaseMock();

    sut = SearchController(
      getCepInfoByCepNumberUsecase: getCepInfoByCepNumber,
      findSavedCepUsecase: findSavedCepUsecase,
      deleteCepByIdUsecase: deleteCepByIdUsecase,
      saveCepUsecase: saveCepUsecase,
    );
  });
  group('HomeController', () {
    successFind() {
      when(() => findSavedCepUsecase.call())
          .thenAnswer((_) async => Right(CepMock.validCepEntityList));
    }

    failFind() {
      when(() => findSavedCepUsecase.call())
          .thenAnswer((_) async => Left(Exception()));
    }

    test('Should return a valid instance', () {
      expect(sut, isA<SearchController>());
    });

    test('Should be return valid method to find all save cep length', () async {
      successFind();
      final result = await sut.findAllHistoric();
      verify(() => findSavedCepUsecase.call()).called(1);
      expect(result, isA<List<CepEntity>>());
      expect(result, CepMock.validCepEntityList);
    });

    test('Should be return a error log when find all save cep method fail',
        () async {
      failFind();
      sut.findAllHistoric();
    });

    test('Should be return a valid method to check if cep is already saved cep',
        () {
      successFind();
      sut.cepEntity = CepMock.validCepEntity;
      sut.checkIfCepIsAlreadySaved();
      verify(() => findSavedCepUsecase.call()).called(1);
      expect(sut.isSavedButtonPressed.value, false);
    });

    test('dispose', () {
      sut.dispose();
    });
  });
}
