import 'package:challange_mobile_developer_flutter/presenter/pages/home/home_controller.dart';
import 'package:challange_mobile_developer_flutter/presenter/pages/initial/initial_page.dart';
import 'package:challange_mobile_developer_flutter/presenter/pages/initial/initial_page_controller.dart';
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
        },
      ),
    )
  ];
}
