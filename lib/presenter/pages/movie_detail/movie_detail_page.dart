import 'package:challange_mobile_developer_flutter/presenter/app_components/app_custom_back_button.dart';
import 'package:challange_mobile_developer_flutter/presenter/pages/movie_detail/components/movie_detail_page_information_box.dart';
import 'package:challange_mobile_developer_flutter/presenter/pages/movie_detail/movie_detail_page_controller.dart';
import 'package:challange_mobile_developer_flutter/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailPage extends GetView<MovieDetailPageController> {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        centerTitle: true,
        title: Text(controller.movieTitle),
        actions: [
          Obx(() {
            return IconButton(
              onPressed: () {
                controller.onFavoriteButtonTap();
              },
              icon: Icon(
                Icons.favorite,
                color: controller.isFavorite.value ? Colors.red : Colors.white,
              ),
            );
          })
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                future: controller.fetchMovieTrailer(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return YoutubePlayer(
                      controller: controller.youtubePlayerController,
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * .25,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              const SizedBox(
                height: 16,
              ),
              MovieDetailPageInformationBox(
                releaseDate: controller.releaseDate,
                grade: controller.grade,
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Overview',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                controller.movieOverview,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
