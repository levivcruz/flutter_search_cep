import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_search_cep/app/app.dart';

import '../../../../mock/cep_mock.dart';

void main() {
  group('Cep Entity', () {
    test('Should be return a valid CepEntity', () {
      final remoteCepModel = CepModel.fromJson(CepMock.validCepJson);

      final cep = CepEntity.fromModel(remoteCepModel);

      expect(cep, isA<CepEntity>());
      expect(cep, CepMock.validCepEntity);
    });

    test('Should be return toString', () {
      final remoteCepModel = CepModel.fromJson(CepMock.validCepJson);

      final cep = CepEntity.fromModel(remoteCepModel);

      expect(cep.toString(), isA<String>());
      expect(cep.toString(), CepMock.validCepEntity.toString());
    });

    test('Should be return hashCode', () {
      final cepEntityHashcode = CepMock.validCepEntity.hashCode;

      expect(cepEntityHashcode, isA<int>());
    });
  });

  test('Should be return an empty CepEntity', () {
    final cepEntity = CepEntity.empty();

    expect(cepEntity, isA<CepEntity>());
    expect(cepEntity, CepMock.emptyCepEntity);
  });
}
