import 'package:flutter_search_cep/app/modules/domain/entities/cep_entity.dart';
import 'package:flutter_search_cep/app/modules/infra/models/cep_model.dart';
import 'package:flutter_search_cep/app/modules/infra/models/cep_error_model.dart';

class CepMock {
  static const String validCep = '01001000';

  static const Map<String, dynamic> validResponseJson = {
    "cep": "01001-000",
    "logradouro": "Praça da Sé",
    "complemento": "lado ímpar",
    "bairro": "Sé",
    "localidade": "São Paulo",
    "uf": "SP",
    "ibge": "3550308",
    "gia": "1004",
    "ddd": "11",
    "siafi": "7107"
  };

  static const Map<String, dynamic> validCepJson = {
    'cep': '01001-000',
    'logradouro': 'Praça da Sé',
    'complemento': 'lado ímpar',
    'localidade': 'São Paulo',
    'uf': 'SP',
    'id': 1,
  };

  static const Map<String, dynamic> validLocalCepJson = {
    'cep': '01001-000',
    'street': 'Praça da Sé',
    'complement': 'lado ímpar',
    'city': 'São Paulo',
    'uf': 'SP',
  };

  static const Map<String, dynamic> validRemoteErrorJson = {"erro": "true"};

  static const Map<String, dynamic> invalidRemoteErrorJson = {};

  static const Map<String, dynamic> invalidCepJson = {};

  static CepErrorModel validRemoteErrorModel = CepErrorModel(error: "true");

  static CepErrorModel emptyRemoteErrorModel = CepErrorModel(error: "");

  static CepModel validRemoteCepModel = CepModel(
    cep: '01001-000',
    street: 'Praça da Sé',
    complement: 'lado ímpar',
    city: 'São Paulo',
    uf: 'SP',
  );

  static CepModel invalidRemoteCepModel =
      CepModel(cep: '', street: '', complement: '', city: '', uf: '', id: 0);

  static CepModel emptyRemoteCepModel =
      CepModel(cep: '', street: '', complement: '', city: '', uf: '', id: 0);

  static CepEntity validCepEntity = CepEntity(
      cep: '01001-000',
      street: 'Praça da Sé',
      complement: 'lado ímpar',
      city: 'São Paulo',
      uf: 'SP',
      id: 0);

  static List<CepModel> validRemoteCepModelList = [
    CepModel(
        cep: '01001-000',
        street: 'Praça da Sé',
        complement: 'lado ímpar',
        city: 'São Paulo',
        uf: 'SP',
        id: 0),
    CepModel(
        cep: '01001-001',
        street: 'Praça da Sé',
        complement: 'lado par',
        city: 'São Paulo',
        uf: 'SP',
        id: 1),
  ];

  static List<CepEntity> validCepEntityList = [
    CepEntity(
        cep: '01001-000',
        street: 'Praça da Sé',
        complement: 'lado ímpar',
        city: 'São Paulo',
        uf: 'SP',
        id: 0),
    CepEntity(
        cep: '01001-001',
        street: 'Praça da Sé',
        complement: 'lado par',
        city: 'São Paulo',
        uf: 'SP',
        id: 1),
  ];

  static CepEntity invalidCepEntity =
      CepEntity(cep: '', street: '', complement: '', city: '', uf: '', id: 0);
  static CepEntity emptyCepEntity =
      CepEntity(cep: '', street: '', complement: '', city: '', uf: '', id: 0);
}
