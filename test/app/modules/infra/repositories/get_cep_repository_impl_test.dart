import 'package:either_dart/either.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_search_cep/app/app.dart';

import '../../../../mock/cep_mock.dart';

class RemoteCepDatasourceMock extends Mock implements RemoteCepDatasource {}

void main() {
  late GetCepRepository sut;
  late RemoteCepDatasource datasource;
  setUp(() {
    datasource = RemoteCepDatasourceMock();
    sut = GetCepRepositoryImpl(datasource: datasource);
  });

  group('Get cep repository', () {
    success() {
      when(() => datasource.getCepInfoByCepNumber(CepMock.validCep)).thenAnswer(
          (invocation) async =>
              Right(HttpResponse(data: CepMock.validCepJson, statusCode: 200)));
    }

    fail(FailureRequest error) {
      when(() => datasource.getCepInfoByCepNumber(CepMock.validCep))
          .thenAnswer((_) async => Left(error));
    }

    test('Should be return success when call repository', () async {
      success();
      final result = await sut.call(CepMock.validCep);
      verify(() => datasource.getCepInfoByCepNumber(CepMock.validCep))
          .called(1);
      expect(result, isA<Either<FailureRequest, CepEntity>>());
      expect(result.isRight, true);
      expect(result.right, isA<CepEntity>());
      expect(result.right, CepMock.validCepEntity);
    });

    test('Should be return error when call repository', () async {
      fail(FailureRequest.badRequest());
      final result = await sut.call(CepMock.validCep);
      verify(() => datasource.getCepInfoByCepNumber(CepMock.validCep))
          .called(1);
      expect(result, isA<Either<FailureRequest, CepEntity>>());
      expect(result.isLeft, true);
      expect(result.left, isA<FailureRequest>());
      expect(result.left, FailureRequest.badRequest());
    });
  });

  test('Should be return a Failure request when result contains "erro"',
      () async {
    when(() => datasource.getCepInfoByCepNumber(CepMock.validCep)).thenAnswer(
        (_) async =>
            Right(HttpResponse(data: {"erro": "true"}, statusCode: 200)));
    final result = await sut.call(CepMock.validCep);
    expect(result, isA<Either<FailureRequest, CepEntity>>());
    expect(result.isLeft, true);
    expect(result.left, isA<FailureRequest>());
    expect(result.left, const FailureRequest(message: 'CEP not found'));
  });
}
