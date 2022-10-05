import '../../../app.dart';

class CepModel {
  int? id;
  String cep;
  String street;
  String complement;
  String city;
  String uf;
  CepModel({
    this.id,
    required this.cep,
    required this.street,
    required this.complement,
    required this.city,
    required this.uf,
  });

  factory CepModel.fromJson(Map<String, dynamic> json) =>
      GlobalValidationMapFunction.checkMap(
        keys: [
          'cep',
          'logradouro',
          'complemento',
          'localidade',
          'uf',
        ],
        map: json,
        className: 'CepModel',
      )
          ? CepModel(
              cep: json["cep"] as String,
              street: json["logradouro"] as String,
              complement: json["complemento"] as String,
              city: json["localidade"] as String,
              uf: json["uf"] as String,
            )
          : CepModel.empty();

  factory CepModel.fromMap(Map<String, dynamic> map) {
    return CepModel(
      id: map['id'],
      cep: map["cep"] as String,
      street: map["street"] as String,
      complement: map["complement"] as String,
      city: map["city"] as String,
      uf: map["uf"] as String,
    );
  }

  static Map<String, dynamic> toJson(CepEntity entity) {
    return {
      'cep': entity.cep,
      'street': entity.street,
      'complement': entity.complement,
      'city': entity.city,
      'uf': entity.uf,
    };
  }

  factory CepModel.empty() => CepModel(
        id: 0,
        cep: '',
        street: '',
        complement: '',
        city: '',
        uf: '',
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CepModel &&
        other.id == id &&
        other.cep == cep &&
        other.street == street &&
        other.complement == complement &&
        other.city == city &&
        other.uf == uf;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        cep.hashCode ^
        street.hashCode ^
        complement.hashCode ^
        city.hashCode ^
        uf.hashCode;
  }

  @override
  String toString() {
    return 'CepModel(id: $id, cep: $cep, street: $street, complement: $complement, city: $city, uf: $uf)';
  }
}
