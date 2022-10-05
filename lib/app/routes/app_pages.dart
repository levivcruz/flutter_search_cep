import 'package:get/get.dart';

import '../app.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: AppRoutes.search,
      page: () => const SearchPage(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: AppRoutes.historic,
      page: () => const HistoryPage(),
      binding: HistoryBinding(),
    ),
  ];
}
