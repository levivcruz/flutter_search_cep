import 'package:get/get.dart';

import 'app/app.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SqliteConnection>(() => SqliteConnectionImpl.instance);

    Get.put<HttpService>(DioService());

    Get.put<RemoteCepDatasource>(
        RemoteCepDatasourceImpl(httpService: Get.find()));

    Get.put<SqliteHistoric>(SqliteHistoricImpl(), permanent: true);

    Get.put<LocalCepDatasource>(
        LocalCepDatasourceImpl(sqliteHistoric: Get.find<SqliteHistoric>()));
    Get.put<SavedCepRepository>(
        SavedCepRepositoryImpl(datasource: Get.find<LocalCepDatasource>()));
    Get.put<FindSavedCepUsecase>(
        FindSavedCepUsecaseImpl(repository: Get.find<SavedCepRepository>()));
    Get.put<DeleteCepByIdUsecase>(
        DeleteCepByIdUsecaseImpl(repository: Get.find<SavedCepRepository>()));
  }
}
