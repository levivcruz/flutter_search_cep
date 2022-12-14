import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../app.dart';

class HistoryAddressCardWidget extends GetView<HistoryController> {
  final CepEntity entity;

  const HistoryAddressCardWidget({
    Key? key,
    required this.entity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(
          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                entity.cep,
                style: Get.textTheme.bodyText1?.copyWith(
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                  color: AppColors().fifthNormalGreyColor,
                ),
              ),
              InkWell(
                radius: 5,
                onTap: () => controller.deleteSaveCepById(entity.id),
                borderRadius: BorderRadius.circular(5),
                child: Ink(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SvgPicture.asset(
                    IconPaths.TRASH,
                    color: Get.theme.primaryColor,
                    width: 19.5,
                    height: 20.5,
                    fit: BoxFit.contain,
                  ),
                ),
              )
            ],
          ),
          Text(
            controller.formatAddressString(entity),
            style: Get.textTheme.subtitle2?.copyWith(
              height: 1.5,
              color: AppColors().fifthNormalGreyColor,
            ),
          ),
        ]),
      ),
    );
  }
}
