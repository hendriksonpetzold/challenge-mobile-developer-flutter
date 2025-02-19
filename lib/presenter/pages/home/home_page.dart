import 'package:challange_mobile_developer_flutter/presenter/app_components/app_movie_card.dart';
import 'package:challange_mobile_developer_flutter/presenter/pages/home/components/home_page_search_form_field.dart';
import 'package:challange_mobile_developer_flutter/presenter/pages/home/components/home_page_select_movie_type_bar.dart';
import 'package:challange_mobile_developer_flutter/presenter/pages/home/components/home_page_select_movie_type_shimmer.dart';
import 'package:challange_mobile_developer_flutter/presenter/pages/home/components/home_page_shimmer_list.dart';
import 'package:challange_mobile_developer_flutter/presenter/pages/home/home_controller.dart';
import 'package:challange_mobile_developer_flutter/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
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
            const SizedBox(
              height: 8,
            ),
            Obx(
              () {
                if (controller.isLoading.value == false) {
                  return const HomePageSelectMovieTypeBar();
                } else {
                  return const HomePageSelectMovieTypeShimmer();
                }
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Obx(
              () {
                return Expanded(
                  child: controller.isLoading.value
                      ? const HomePageShimmerList()
                      : Obx(
                          () {
                            return SmartRefresher(
                              controller: controller.refreshController,
                              enablePullUp: true,
                              onRefresh: () {
                                controller.onRefresh();
                              },
                              onLoading: () {
                                controller.onLoading();
                              },
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
                                    tag: 'tag$index',
                                    onAddIconTap: () {
                                      final movieBox = controller
                                          .favoriteMovieBox
                                          .get(movie.name);
                                      Get.toNamed(
                                        '/movie_detail',
                                        arguments: {
                                          'movieId': movie.id,
                                          'movieImage': movie.image,
                                          'movieTitle': movie.name,
                                          'movieOverview': movie.overview,
                                          'releaseDate': movie.releaseDate,
                                          'voteAverage': movie.voteAverage,
                                          'genreIds': movie.genreIds,
                                          'genres': controller.genres,
                                          'isFavorite':
                                              movieBox?.isFavorite ?? false,
                                          'tag': 'tag$index'
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
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
