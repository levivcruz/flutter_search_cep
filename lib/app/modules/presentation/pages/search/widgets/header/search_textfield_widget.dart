import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../../../app.dart';

class SearchTextfieldWidget extends GetView<SearchController> {
  const SearchTextfieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder defaultBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: BorderSide(
            style: BorderStyle.solid,
            color: AppColors().secondExtraLightGreyColor,
            width: 1));
    return TextField(
      controller: controller.searchTextFieldController,
      keyboardType: TextInputType.number,
      cursorColor: AppColors().primaryColor,
      style: Get.textTheme.bodyText2
          ?.copyWith(height: 1.5, color: AppColors().secondNormalGreyColor),
      decoration: InputDecoration(
          hintText: 'Pesquisar CEP',
          isCollapsed: false,
          hintStyle: Get.textTheme.bodyText2
              ?.copyWith(height: 1.5, color: AppColors().secondNormalGreyColor),
          border: defaultBorder,
          filled: true,
          enabledBorder: defaultBorder,
          focusedBorder: defaultBorder,
          fillColor: AppColors().normalWhiteColor,
          prefixIconConstraints: const BoxConstraints(
              minWidth: 49, maxWidth: 49, maxHeight: 49, minHeight: 49),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 10, left: 19),
            child: SvgPicture.asset(
              IconPaths.SEARCH,
              alignment: Alignment.center,
              color: AppColors().secondNormalGreyColor,
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 13, horizontal: 60)),
      textAlignVertical: TextAlignVertical.center,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(8),
        MaskTextInputFormatter(mask: '#####-###'),
      ],
      onSubmitted: (string) => controller.submitSearch(),
    );
  }
}
