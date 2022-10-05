import 'package:dio/dio.dart';

import '../../../app.dart';

class DioService implements HttpService {
  final _client = Dio();

  @override
  Future<DioService> getInstance() async {
    return this;
  }

  @override
  Future<HttpResponse> get({required String url}) async {
    final response = await _client.get(url);

    return HttpResponse(
      data: response.data,
      statusCode: response.statusCode,
    );
  }
}
