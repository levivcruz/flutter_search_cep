import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../app.dart';

class SearchSaveButtonWidget extends GetView<SearchController> {
  const SearchSaveButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        elevation: 0,
        color: controller.isSavedButtonPressed.value
            ? AppColors().secondNormalWhiteColor
            : AppColors().normalBlueColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          splashColor: AppColors().lightPurpleColor.withOpacity(.5),
          onTap: () => controller.onTapSavedButton(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Stack(
                      clipBehavior: Clip.antiAlias,
                      children: [
                        _buildAnimatedStar(true),
                        _buildAnimatedStar(false)
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Obx(
                    () => Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        controller.isSavedButtonPressed.value
                            ? 'Endereço Salvo'
                            : 'Salvar Endereço',
                        style: Get.textTheme.subtitle1?.copyWith(
                            color: controller.isSavedButtonPressed.value
                                ? AppColors().normalPurpleColor
                                : AppColors().normalWhiteColor,
                            height: 1,
                            fontFamily: 'Hind'),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedPositioned _buildAnimatedStar(bool isFilled) {
    return AnimatedPositioned(
      top: isFilled
          ? controller.isSavedButtonPressed.value
              ? 13
              : -30
          : controller.isSavedButtonPressed.value
              ? 60
              : 13,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Icon(isFilled ? Icons.save : Icons.save,
          color: isFilled
              ? AppColors().normalYellowColor
              : AppColors().secondLightPurpleColor,
          size: 23),
    );
  }
}
