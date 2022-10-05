import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_search_cep/app/app.dart';

void main() {
  late IconPaths sut;

  setUp(() {
    sut = IconPaths();
  });

  group('Icon paths', () {
    test('Should be return String of search icon path', () {
      expect(sut.search, 'assets/icons/search.svg');
    });

    test('Should be return String of signpost icon path', () {
      expect(sut.signpost, 'assets/icons/signpost.svg');
    });

    test('Should be return String of trash icon path', () {
      expect(sut.trash, 'assets/icons/trash.svg');
    });
  });
}
