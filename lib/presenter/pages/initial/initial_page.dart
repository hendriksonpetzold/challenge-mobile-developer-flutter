import 'package:challange_mobile_developer_flutter/enums/bottom_bar_pages_enum.dart';
import 'package:challange_mobile_developer_flutter/presenter/pages/favorite/favorite_page.dart';
import 'package:challange_mobile_developer_flutter/presenter/pages/home/home_page.dart';
import 'package:challange_mobile_developer_flutter/presenter/pages/initial/components/initial_page_bottom_navigation_bar.dart';
import 'package:challange_mobile_developer_flutter/presenter/pages/initial/initial_page_controller.dart';
import 'package:challange_mobile_developer_flutter/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitialPage extends GetView<InitialPageController> {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: Obx(
          () {
            return IndexedStack(
              index: controller.getPageIndex(),
              children: [
                Obx(() {
                  return AnimatedOpacity(
                    opacity: controller.homePageOpacity.value,
                    duration: const Duration(seconds: 2),
                    child: const HomePage(),
                  );
                }),
                Obx(() {
                  return AnimatedOpacity(
                    opacity: controller.favoritePageOpacity.value,
                    duration: const Duration(seconds: 2),
                    child: const FavoritePage(),
                  );
                })
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: Obx(
        () {
          return InitialPageBottomNavigationBar(
            children: [
              GestureDetector(
                child: Icon(
                  Icons.home_outlined,
                  size: 30,
                  color: controller.checkActivePage(BottomBarPagesEnum.home)
                      ? AppColors.accentColor
                      : AppColors.unSelectedIcon,
                ),
                onTap: () {
                  controller.onHomeButtonPressed();
                },
              ),
              GestureDetector(
                child: Icon(
                  Icons.favorite,
                  size: 30,
                  color: controller.checkActivePage(BottomBarPagesEnum.favorite)
                      ? AppColors.accentColor
                      : AppColors.unSelectedIcon,
                ),
                onTap: () {
                  controller.onFavoriteButtonPressed();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
