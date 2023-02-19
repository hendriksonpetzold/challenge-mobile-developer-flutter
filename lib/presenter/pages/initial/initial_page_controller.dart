import 'package:challange_mobile_developer_flutter/enums/bottom_bar_pages_enum.dart';

import 'package:get/get.dart';

class InitialPageController extends GetxController {
  final Rx<BottomBarPagesEnum> _activePage =
      Rx<BottomBarPagesEnum>(BottomBarPagesEnum.home);

  RxDouble homePageOpacity = RxDouble(1);
  RxDouble favoritePageOpacity = RxDouble(0);

  Future<void> onHomeButtonPressed() async {
    favoritePageOpacity.value = 0;
    await Future.delayed(const Duration(seconds: 2));
    changePage(BottomBarPagesEnum.home);
    homePageOpacity.value = 1;
  }

  Future<void> onFavoriteButtonPressed() async {
    homePageOpacity.value = 0;
    await Future.delayed(const Duration(seconds: 2));
    changePage(BottomBarPagesEnum.favorite);
    favoritePageOpacity.value = 1;
  }

  bool checkActivePage(BottomBarPagesEnum page) {
    if (page == _activePage.value) {
      return true;
    } else {
      return false;
    }
  }

  void changePage(BottomBarPagesEnum page) {
    _activePage.value = page;
  }

  int getPageIndex() {
    switch (_activePage.value) {
      case BottomBarPagesEnum.home:
        return 0;
      case BottomBarPagesEnum.favorite:
        return 1;
      default:
        return 0;
    }
  }
}
