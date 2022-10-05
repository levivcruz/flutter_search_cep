import 'package:either_dart/either.dart';

import '../../../app.dart';

class RemoteCepDatasourceImpl implements RemoteCepDatasource {
  final HttpService _httpService;

  RemoteCepDatasourceImpl({required HttpService httpService})
      : _httpService = httpService;

  @override
  Future<Either<FailureRequest, HttpResponse>> getCepInfoByCepNumber(
      String cepNumber) async {
    final response = await _httpService.get(
      url:
          '${DatasourceConstants.CEP_API_URL}$cepNumber${DatasourceConstants.CEP_API_RESPONSE_TYPE}',
    );
    return _handleResponse(response);
  }

  Either<FailureRequest, HttpResponse> _handleResponse(HttpResponse response) {
    switch (response.statusCode) {
      case 200:
        return Right(response);
      case 201:
        return Right(response);
      case 204:
        return Right(response);
      case 400:
        return Left(FailureRequest.badRequest(response.data));
      case 404:
        return Left(FailureRequest.notFound(response.data));
      case 500:
        return Left(FailureRequest.serverError(response.data));
      case 409:
        return Left(FailureRequest.conflict(response.data));
      case 403:
        return Left(FailureRequest.forbidden(response.data));
      default:
        return Left(FailureRequest.unknownError(response.data));
    }
  }
}
