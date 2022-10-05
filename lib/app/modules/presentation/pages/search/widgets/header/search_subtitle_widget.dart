import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../app.dart';

class SearchSubtitleWidget extends StatelessWidget {
  const SearchSubtitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        'Digite o CEP que você\ndeseja procurar',
        textAlign: TextAlign.center,
        style: Get.textTheme.subtitle1?.copyWith(
            fontSize: 18, height: 1.35, color: AppColors().normalWhiteColor),
      ),
    );
  }
}
