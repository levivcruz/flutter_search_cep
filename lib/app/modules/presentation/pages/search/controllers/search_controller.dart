import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'package:get/get.dart';

import '../../../../../app.dart';

class SearchController extends GetxController {
  CepEntity _cepEntity = CepEntity.empty();
  RxBool isLoading = false.obs;
  RxString foundAddress = ''.obs;
  RxBool isSavedButtonPressed = false.obs;
  RxDouble lat = 0.0.obs;
  RxDouble long = 0.0.obs;
  TextEditingController searchTextFieldController = TextEditingController();

  set cepEntity(CepEntity value) {
    value = _cepEntity;
  }

  final GetCepInfoByCepNumberUsecase _getCepInfoByCepNumberUsecase;
  final SaveCepUsecase _saveCepUsecase;
  final FindSavedCepUsecase _findSavedCepUsecase;
  final DeleteCepByIdUsecase _deleteCepByIdUsecase;

  SearchController({
    required GetCepInfoByCepNumberUsecase getCepInfoByCepNumberUsecase,
    required SaveCepUsecase saveCepUsecase,
    required FindSavedCepUsecase findSavedCepUsecase,
    required DeleteCepByIdUsecase deleteCepByIdUsecase,
  })  : _getCepInfoByCepNumberUsecase = getCepInfoByCepNumberUsecase,
        _saveCepUsecase = saveCepUsecase,
        _deleteCepByIdUsecase = deleteCepByIdUsecase,
        _findSavedCepUsecase = findSavedCepUsecase;

  void onTapSavedButton() async {
    isSavedButtonPressed.value = !isSavedButtonPressed.value;

    if (isSavedButtonPressed.value) {
      await _insertSaveCep();
    } else {
      await _deleteSaveCepById();
    }
  }

  Future<void> getCepInfoByCepNumber(String cepNumber) async {
    isLoading.value = true;
    String cepNumberFormatted = cepNumber.replaceAll('-', '');
    final result = await _getCepInfoByCepNumberUsecase.call(cepNumberFormatted);

    if (result.isRight) {
      _cepEntity = result.right;
      isSavedButtonPressed.value = false;
      foundAddress.value = FormatAddressString.formatByCepEntity(_cepEntity);
      await getGeoCode();
      checkIfCepIsAlreadySaved();
      isLoading.value = false;
    } else {
      isLoading.value = false;
      GlobalShowSnackbarFunction().show(
          'Não conseguimos localizar seu endereço, verifique se as informações passadas estão corretas',
          color: AppColors().normalRedColor);
    }
  }

  void submitSearch() {
    if (searchTextFieldController.text.length == 9) {
      getCepInfoByCepNumber(searchTextFieldController.text);
    }
  }

  Future<void> _insertSaveCep() async {
    final result = await _saveCepUsecase(_cepEntity);

    if (result.isLeft) {
      return;
    }

    _cepEntity.id = result.right;
  }

  Future<void> _deleteSaveCepById() async {
    final CepEntity entity = _cepEntity;

    final result = await _deleteCepByIdUsecase(entity.id);

    if (result.isLeft) {
      return;
    }
  }

  Future<List<CepEntity>> findAllHistoric() async {
    final result = await _findSavedCepUsecase();

    if (result.isLeft) {
      return [];
    }
    return result.right;
  }

  checkIfCepIsAlreadySaved() {
    findAllHistoric().then((list) {
      for (var cep in list) {
        if (cep.cep == _cepEntity.cep) {
          isSavedButtonPressed.value = true;
          _cepEntity.id = cep.id;
        }
      }
    });
  }

  getGeoCode() async {
    GeoCode geoCode = GeoCode();
    Coordinates coordinates =
        await geoCode.forwardGeocoding(address: _cepEntity.cep);
    lat.value = coordinates.latitude as double;
    long.value = coordinates.longitude as double;
  }

  @override
  void dispose() {
    super.dispose();
    searchTextFieldController.dispose();
  }
}
