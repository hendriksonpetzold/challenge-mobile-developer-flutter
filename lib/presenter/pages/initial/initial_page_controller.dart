import 'package:challange_mobile_developer_flutter/enums/bottom_bar_pages_enum.dart';
import 'package:get/get.dart';

class InitialPageController extends GetxController {
  final Rx<BottomBarPagesEnum> activePage =
      Rx<BottomBarPagesEnum>(BottomBarPagesEnum.home);

  bool checkActivePage(BottomBarPagesEnum page) {
    if (page == activePage.value) {
      return true;
    } else {
      return false;
    }
  }

  void changePage(BottomBarPagesEnum page) {
    activePage.value = page;
  }

  int getPageIndex() {
    switch (activePage.value) {
      case BottomBarPagesEnum.home:
        return 0;
      case BottomBarPagesEnum.favorite:
        return 1;
      default:
        return 0;
    }
  }
}
