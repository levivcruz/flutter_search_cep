import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../app.dart';

class SearchTitleWidget extends StatelessWidget {
  const SearchTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Pesquisar CEP',
          style: Get.textTheme.headline5
              ?.copyWith(color: AppColors().normalWhiteColor)),
    );
  }
}
