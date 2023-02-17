import 'package:challange_mobile_developer_flutter/presenter/pages/favorite/favorite_controller.dart';
import 'package:challange_mobile_developer_flutter/presenter/pages/home/home_controller.dart';
import 'package:challange_mobile_developer_flutter/presenter/pages/initial/initial_page.dart';
import 'package:challange_mobile_developer_flutter/presenter/pages/initial/initial_page_controller.dart';
import 'package:challange_mobile_developer_flutter/presenter/pages/movie_detail/movie_detail_page.dart';
import 'package:challange_mobile_developer_flutter/presenter/pages/movie_detail/movie_detail_page_controller.dart';
import 'package:get/get.dart';

class Routes {
  static final List<GetPage> routes = [
    GetPage(
      name: '/',
      page: () => const InitialPage(),
      binding: BindingsBuilder(
        () {
          Get.put(InitialPageController());
          Get.put(HomeController());
          Get.put(FavoriteController());
        },
      ),
      children: [
        GetPage(
            name: '/movie_detail',
            page: () => const MovieDetailPage(),
            binding: BindingsBuilder(
              () {
                Get.put(MovieDetailPageController());
              },
            ))
      ],
    )
  ];
}
