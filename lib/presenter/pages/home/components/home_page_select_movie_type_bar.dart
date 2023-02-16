import 'package:challange_mobile_developer_flutter/presenter/app_components/app_text_button.dart';
import 'package:challange_mobile_developer_flutter/presenter/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageSelectMovieTypeBar extends GetView<HomeController> {
  const HomePageSelectMovieTypeBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Expanded(
        child: Obx(
          () {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.genres.length + 1,
              itemBuilder: (context, index) {
                final movieTypeEnum = controller.movieTypes[index];
                if (index == 0) {
                  return Obx(() {
                    return AppTextButton(
                      isSelected: controller.checkActiveList(
                        newMovieType: movieTypeEnum,
                      ),
                      padding: const EdgeInsets.only(
                        bottom: 4,
                        left: 8,
                        right: 8,
                      ),
                      label: 'All',
                      onTap: () {
                        controller.changeList(newMovieType: movieTypeEnum);
                        controller.fetchMoviesByGenre('All');
                      },
                    );
                  });
                } else {
                  final genre = controller.genres[index - 1];
                  return Obx(() {
                    return AppTextButton(
                      isSelected: controller.checkActiveList(
                        newMovieType: movieTypeEnum,
                      ),
                      padding: const EdgeInsets.only(
                        bottom: 4,
                        left: 8,
                        right: 8,
                      ),
                      label: genre.name,
                      onTap: () {
                        controller.changeList(newMovieType: movieTypeEnum);
                        controller.fetchMoviesByGenre(genre.name);
                      },
                    );
                  });
                }
              },
            );
          },
        ),
      ),
    );
  }
}
