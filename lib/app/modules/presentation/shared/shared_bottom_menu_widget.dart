import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../app.dart';

class SharedBottomMenuWidget extends StatelessWidget {
  const SharedBottomMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: AppColors().normalWhiteColor,
        currentIndex: getCurrentIndex(),
        unselectedItemColor: AppColors().normalGreyColor,
        selectedItemColor: AppColors().primaryColor,
        onTap: changeIndex(),
        unselectedLabelStyle: Get.textTheme.overline,
        selectedLabelStyle: Get.textTheme.overline,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () async {
                Get.offNamed(AppRoutes.search);
              },
              icon: SvgPicture.asset(
                IconPaths.SIGNPOST,
                color: getCurrentIndex() == 0
                    ? AppColors().primaryColor
                    : AppColors().normalGreyColor,
              ),
            ),
            label: 'Procurar',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () async {
                Get.offNamed(AppRoutes.historic);
              },
              icon: Icon(
                Icons.save,
                color: getCurrentIndex() == 1
                    ? AppColors().primaryColor
                    : AppColors().normalGreyColor,
              ),
            ),
            label: 'Histórico',
          ),
        ],
      ),
    );
  }
}

int getCurrentIndex() {
  switch (Get.currentRoute) {
    case AppRoutes.search:
      return 0;
    case AppRoutes.historic:
      return 1;
    default:
      return 99;
  }
}

changeIndex() {
  switch (getCurrentIndex()) {
    case 0:
      Get.toNamed(AppRoutes.search);
      break;
    case 1:
      Get.toNamed(AppRoutes.historic);
      break;
    default:
  }
}
