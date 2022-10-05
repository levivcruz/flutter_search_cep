import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app.dart';

class SearchPage extends GetView<SearchController> {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const SharedBottomMenuWidget(),
        body: Center(
          child: Column(
            children: [
              Container(
                height: 232,
                width: context.width,
                color: Get.theme.primaryColor,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32, 50, 35, 21),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      SearchTitleWidget(),
                      SearchSubtitleWidget(),
                      SearchTextfieldWidget()
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Obx(
                    () => Visibility(
                      visible: controller.isLoading.value,
                      replacement: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Visibility(
                          visible: controller.foundAddress.value.isNotEmpty,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: const [
                              SizedBox(height: 17),
                              SearchAddressTitleWidget(),
                              SizedBox(height: 17),
                              SearchAddressWidget(),
                              SizedBox(height: 29),
                              SearchSaveButtonWidget(),
                              SizedBox(height: 29),
                              SearchMapWidget(),
                            ],
                          ),
                        ),
                      ),
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
