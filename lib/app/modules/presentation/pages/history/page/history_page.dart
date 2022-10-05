import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app.dart';

class HistoryPage extends GetView<HistoryController> {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const SharedBottomMenuWidget(),
        body: Stack(
          children: [
            const HistoryBackgroundWidget(),
            Obx(
              () => Visibility(
                visible: controller.isLoading.value,
                replacement: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HistoryTitleWidget(),
                    const SizedBox(height: 25),
                    Expanded(
                      child: Obx(
                        () => ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.myHistoric.length,
                          itemBuilder: (_, index) {
                            var saveCep = controller.myHistoric[index];
                            return HistoryAddressCardWidget(entity: saveCep);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                child: const Center(child: CircularProgressIndicator()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
