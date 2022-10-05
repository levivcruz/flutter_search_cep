import 'package:either_dart/either.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_search_cep/app/app.dart';

import '../../../../../../mock/cep_mock.dart';

class FindSavedCepUsecaseMock extends Mock implements FindSavedCepUsecase {}

class DeleteCepByIdUsecaseMock extends Mock implements DeleteCepByIdUsecase {}

void main() {
  late FindSavedCepUsecaseMock findSavedCepUsecaseMock;
  late DeleteCepByIdUsecaseMock deleteCepByIdUsecaseMock;
  late HistoryController sut;
  setUp(() {
    findSavedCepUsecaseMock = FindSavedCepUsecaseMock();
    deleteCepByIdUsecaseMock = DeleteCepByIdUsecaseMock();
    sut = HistoryController(
      findSavedCepUsecase: findSavedCepUsecaseMock,
      deleteCepByIdUsecase: deleteCepByIdUsecaseMock,
    );
  });
  group('HomeController', () {
    successFind() {
      when(() => findSavedCepUsecaseMock.call())
          .thenAnswer((_) async => Right(CepMock.validCepEntityList));
    }

    failFind() {
      when(() => findSavedCepUsecaseMock.call())
          .thenAnswer((_) async => Left(Exception()));
    }

    successDelete() {
      when(() => deleteCepByIdUsecaseMock.call(1))
          .thenAnswer((_) async => const Right(null));
    }

    failDelete() {
      when(() => deleteCepByIdUsecaseMock.call(0))
          .thenAnswer((_) async => Left(Exception()));
    }

    test('Should return a valid instance', () {
      expect(sut, isA<HistoryController>());
    });

    test('Should be return valid method to find all savecep length', () async {
      successFind();
      await sut.findAllHistoric();
      verify(() => findSavedCepUsecaseMock.call()).called(1);
      expect(sut.myHistoric, isA<List<CepEntity>>());
      expect(sut.myHistoric, CepMock.validCepEntityList);
    });

    test('Should be return a error log when find all save cep method fail',
        () async {
      failFind();
      sut.findAllHistoric();
    });

    test('Should be return valid method to delete save cep by id', () async {
      successDelete();
    });

    test('Should be return a error log when delete save cep by id method fail',
        () async {
      failDelete();
      sut.deleteSaveCepById(0);
    });

    test('Should be return a method to format address string', () async {
      sut.formatAddressString(CepMock.validCepEntity);
    });
  });
}
