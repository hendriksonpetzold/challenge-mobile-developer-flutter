import 'package:challange_mobile_developer_flutter/presenter/pages/movie_detail/components/movie_detail_page_information_body.dart';

import 'package:challange_mobile_developer_flutter/presenter/pages/movie_detail/movie_detail_page_controller.dart';
import 'package:challange_mobile_developer_flutter/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailPage extends GetView<MovieDetailPageController> {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          title: Text(controller.movieTitle),
          actions: [
            Obx(
              () {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      controller.onFavoriteButtonTap(context);
                    },
                    child: controller.isFavorite.value
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.favorite_outline,
                          ),
                  ),
                );
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              LayoutBuilder(builder: (context, constrains) {
                if (constrains.maxWidth < 600) {
                  return const TabBar(
                    indicatorColor: AppColors.accentColor,
                    tabs: [
                      Tab(
                        icon: Text(
                          'Informations',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Tab(
                        icon: Text(
                          'Trailer',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              }),
              Expanded(
                child: TabBarView(
                  children: [
                    MovieDetailPageInformationBody(
                      heroTag: controller.tag,
                      movieImage: controller.movieImage,
                      releaseDate: controller.releaseDate,
                      overview: controller.movieOverview,
                      voteAverage: '${controller.grade}',
                      genres: controller.genresById.join(', '),
                    ),
                    FutureBuilder(
                      future: controller.fetchMovieTrailer(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Align(
                            alignment: Alignment.topCenter,
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(),
                              child: YoutubePlayer(
                                controller: controller.youtubePlayerController,
                              ),
                            ),
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
