import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_search_cep/app/app.dart';

void main() {
  late HttpService sut;
  setUp(() {
    sut = DioService();
  });
  group('DioService', () {
    test('should return statuscode 200', () async {
      final result = await sut.get(
        url: 'https://google.com',
      );
      expect(result, isA<HttpResponse>());
      expect(result.statusCode, 200);
    });

    test('Should be return instance of DioService', () async {
      final result = await sut.getInstance();
      expect(result, isA<DioService>());
    });
  });
}
