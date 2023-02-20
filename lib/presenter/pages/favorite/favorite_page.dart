import 'package:challange_mobile_developer_flutter/presenter/app_components/app_movie_card.dart';
import 'package:challange_mobile_developer_flutter/presenter/pages/favorite/favorite_controller.dart';
import 'package:challange_mobile_developer_flutter/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritePage extends GetView<FavoriteController> {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          top: 16,
        ),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Favorites',
                style: TextStyle(
                  color: AppColors.accentColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Obx(() {
              if (controller.favoriteMovies.isNotEmpty) {
                return Expanded(
                  child: Obx(
                    () {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 2 / 3,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: controller.favoriteMovies.length,
                        itemBuilder: (context, index) {
                          final favoriteMovie =
                              controller.favoriteMovies[index];
                          return AppMovieCard(
                            image: favoriteMovie.image,
                            movieName: favoriteMovie.name,
                            tag: 'favorite$index',
                            onAddIconTap: () {
                              Get.toNamed(
                                '/movie_detail',
                                arguments: {
                                  'movieId': favoriteMovie.id,
                                  'movieImage': favoriteMovie.image,
                                  'movieTitle': favoriteMovie.name,
                                  'movieOverview': favoriteMovie.overview,
                                  'releaseDate': favoriteMovie.releaseDate,
                                  'voteAverage': favoriteMovie.voteAverage,
                                  'genreIds': favoriteMovie.genreIds,
                                  'genres': controller.genres,
                                  'isFavorite': true,
                                  'tag': 'favorite$index'
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                );
              } else {
                return const Text(
                  'You haven\'t added any favorites yet',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }
            })
          ],
        ),
      ),
    );
  }
}
