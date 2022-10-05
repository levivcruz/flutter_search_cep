import 'package:get/get.dart';

import '../../../app.dart';

class HistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryController>(
      () => HistoryController(
        findSavedCepUsecase: Get.find<FindSavedCepUsecase>(),
        deleteCepByIdUsecase: Get.find<DeleteCepByIdUsecase>(),
      ),
    );
  }
}
