import '../../../core/util/global_validation_map_function.dart';

class CepErrorModel {
  String error;
  CepErrorModel({required this.error});

  factory CepErrorModel.fromJson(Map<String, dynamic> map) =>
      GlobalValidationMapFunction.checkMap(
              keys: ['erro'], map: map, className: 'CepErrorModel')
          ? CepErrorModel(
              error: map['erro'] as String,
            )
          : CepErrorModel.empty();

  factory CepErrorModel.empty() {
    return CepErrorModel(
      error: '',
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CepErrorModel && other.error == error;
  }

  @override
  int get hashCode {
    return error.hashCode;
  }

  @override
  String toString() {
    return 'CepErrorModel{error: $error}';
  }
}
