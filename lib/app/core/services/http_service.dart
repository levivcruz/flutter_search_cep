import '../responses/http_response.dart';

abstract class HttpService {
  Future<HttpService> getInstance();
  Future<HttpResponse> get({required String url});
}
