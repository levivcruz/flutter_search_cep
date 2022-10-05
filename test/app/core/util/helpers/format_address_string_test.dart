import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_search_cep/app/app.dart';

import '../../../../mock/cep_mock.dart';

void main() {
  group('Format Address String', () {
    test('Should be return a valid method to format address string', () {
      final sut = FormatAddressString.formatByCepEntity(CepMock.validCepEntity);
      expect(sut, 'Praça da Sé - lado ímpar - São Paulo SP - CEP 01001-000');
    });
  });
}
