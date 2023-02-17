import 'package:challange_mobile_developer_flutter/presenter/app_components/app_movie_card.dart';
import 'package:challange_mobile_developer_flutter/presenter/pages/home/components/home_page_search_form_field.dart';
import 'package:challange_mobile_developer_flutter/presenter/pages/home/components/home_page_select_movie_type_bar.dart';
import 'package:challange_mobile_developer_flutter/presenter/pages/home/home_controller.dart';
import 'package:challange_mobile_developer_flutter/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            HomePageSearchFormField(
              controller: controller.searchEditingController,
              onChanged: (value) => controller.searchMovie(),
            ),
            const HomePageSelectMovieTypeBar(),
            const SizedBox(
              height: 16,
            ),
            Obx(
              () {
                return Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2 / 3,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: controller.searchMovies.length,
                    itemBuilder: (context, index) {
                      final movie = controller.searchMovies[index];
                      return AppMovieCard(
                        image: movie.image,
                        movieName: movie.name,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
