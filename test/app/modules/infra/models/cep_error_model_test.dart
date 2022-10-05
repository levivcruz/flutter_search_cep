import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_search_cep/app/app.dart';

import '../../../../mock/cep_mock.dart';

void main() {
  group('Remote Error Model', () {
    test('Should be return a valid RemoteErrorModel fromJson', () {
      final remoteErrorModel =
          CepErrorModel.fromJson(CepMock.validRemoteErrorJson);

      expect(remoteErrorModel, isA<CepErrorModel>());
      expect(remoteErrorModel, CepErrorModel(error: "true"));
    });

    test('Should be return toString', () {
      final remoteErrorModel =
          CepErrorModel.fromJson(CepMock.validRemoteErrorJson);

      expect(remoteErrorModel.toString(), isA<String>());
      expect(remoteErrorModel.toString(),
          CepMock.validRemoteErrorModel.toString());
    });

    test('Should be return an empty RemoteErrorModel', () {
      final remoteErrorModel = CepErrorModel.empty();

      expect(remoteErrorModel, isA<CepErrorModel>());
      expect(remoteErrorModel, CepMock.emptyRemoteErrorModel);
    });

    test('Should be return an empty RemoteErrorModel when fromJson not work',
        () {
      final remoteErrorModel =
          CepErrorModel.fromJson(CepMock.invalidRemoteErrorJson);

      expect(remoteErrorModel, isA<CepErrorModel>());
      expect(remoteErrorModel, CepMock.emptyRemoteErrorModel);
    });

    test('Should be return hashCode', () {
      final remoteErrorModelHashcode = CepMock.validRemoteErrorModel.hashCode;

      expect(remoteErrorModelHashcode, isA<int>());
    });
  });
}
