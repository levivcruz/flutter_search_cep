import 'package:get/get.dart';

import '../../../../../app.dart';

class HistoryController extends GetxController {
  final FindSavedCepUsecase _findSavedCepUsecase;
  final DeleteCepByIdUsecase _deleteCepByIdUsecase;

  RxList<CepEntity> myHistoric = <CepEntity>[].obs;
  RxBool isLoading = false.obs;

  HistoryController({
    required FindSavedCepUsecase findSavedCepUsecase,
    required DeleteCepByIdUsecase deleteCepByIdUsecase,
  })  : _findSavedCepUsecase = findSavedCepUsecase,
        _deleteCepByIdUsecase = deleteCepByIdUsecase;

  Future<void> findAllHistoric() async {
    isLoading.value = true;
    final result = await _findSavedCepUsecase();

    if (result.isLeft) {
      isLoading.value = false;

      return;
    }

    isLoading.value = false;
    myHistoric.assignAll(result.right);
  }

  Future<void> deleteSaveCepById(int id) async {
    final result = await _deleteCepByIdUsecase(id);

    if (result.isLeft) {
      return;
    }
    await findAllHistoric();
  }

  String formatAddressString(CepEntity cepEntity) =>
      FormatAddressString.formatByCepEntity(cepEntity);

  @override
  void onInit() {
    super.onInit();
    findAllHistoric();
  }
}
