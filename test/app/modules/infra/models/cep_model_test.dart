import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_search_cep/app/app.dart';

import '../../../../mock/cep_mock.dart';

void main() {
  group('Remote Cep Model', () {
    test('Should be return a valid RemoteCepModel fromJson', () {
      final remoteCepModel = CepModel.fromJson(CepMock.validCepJson);

      expect(remoteCepModel, isA<CepModel>());
      expect(remoteCepModel, CepMock.validRemoteCepModel);
    });

    test('Should be return a valid RemoteCepModel fromMap', () {
      final remoteCepModel = CepModel.fromMap(CepMock.validLocalCepJson);

      expect(remoteCepModel, isA<CepModel>());
      expect(remoteCepModel, CepMock.validRemoteCepModel);
    });

    test('Should be return toString', () {
      final remoteCepModel = CepModel.fromJson(CepMock.validCepJson);

      expect(remoteCepModel.toString(), isA<String>());
      expect(remoteCepModel.toString(), CepMock.validRemoteCepModel.toString());
    });

    test('Should be return hashCode', () {
      final remoteCepModelHashcode = CepMock.validRemoteCepModel.hashCode;

      expect(remoteCepModelHashcode, isA<int>());
    });

    test('Should be return an empty RemoteCepModel', () {
      final remoteCepModel = CepModel.empty();

      expect(remoteCepModel, isA<CepModel>());
      expect(remoteCepModel, CepMock.emptyRemoteCepModel);
    });

    test('Should be return an empty RemoteCepModel when fromJson not work', () {
      final remoteCepModel = CepModel.fromJson(CepMock.invalidCepJson);

      expect(remoteCepModel, isA<CepModel>());
      expect(remoteCepModel, CepMock.emptyRemoteCepModel);
    });
  });
}
