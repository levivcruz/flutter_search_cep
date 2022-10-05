import 'package:get/get.dart';

import '../../../app.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SaveCepUsecase>(
        SaveCepUsecaseImpl(repository: Get.find<SavedCepRepository>()));

    Get.put<GetCepRepository>(GetCepRepositoryImpl(datasource: Get.find()));

    Get.put<GetCepInfoByCepNumberUsecase>(GetCepInfoByCepNumberUsecaseImpl(
        repository: Get.find<GetCepRepository>()));

    Get.lazyPut<SearchController>(
      () => SearchController(
        getCepInfoByCepNumberUsecase: Get.find<GetCepInfoByCepNumberUsecase>(),
        saveCepUsecase: Get.find<SaveCepUsecase>(),
        deleteCepByIdUsecase: Get.find<DeleteCepByIdUsecase>(),
        findSavedCepUsecase: Get.find<FindSavedCepUsecase>(),
      ),
    );
  }
}
