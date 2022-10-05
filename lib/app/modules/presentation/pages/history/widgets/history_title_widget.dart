import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryTitleWidget extends StatelessWidget {
  const HistoryTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 46.94, left: 30.56),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.save,
            color: Get.theme.primaryColor,
            size: 32,
          ),
          const SizedBox(height: 14.37),
          Text(
            'Endereços Salvos',
            style: Get.textTheme.headline5
                ?.copyWith(color: Get.theme.primaryColor),
          ),
        ],
      ),
    );
  }
}
