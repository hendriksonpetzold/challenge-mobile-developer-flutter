import 'package:challange_mobile_developer_flutter/domain/entities/genre_entity.dart';
import 'package:challange_mobile_developer_flutter/domain/entities/movie_trailer_entity.dart';
import 'package:challange_mobile_developer_flutter/domain/usecases/get_trailer_by_movie_id/get_trailer_by_movie_id_usecase.dart';
import 'package:challange_mobile_developer_flutter/presenter/pages/favorite/favorite_controller.dart';
import 'package:challange_mobile_developer_flutter/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../domain/entities/movie_entity.dart';

class MovieDetailPageController extends GetxController {
  final GetTrailerByMovieIdUsecase getTrailerByMovieIdUsecase =
      Get.find<GetTrailerByMovieIdUsecase>();
  MovieTrailerEntity? movieTrailer;
  RxString key = RxString('');
  bool isSnackBarUp = false;
  RxBool isFavorite = RxBool(Get.arguments['isFavorite']);
  late Box<MovieEntity> favoriteMovieBox;
  int movieId = Get.arguments['movieId'];
  String movieImage = Get.arguments['movieImage'];
  String movieTitle = Get.arguments['movieTitle'];
  String movieOverview = Get.arguments['movieOverview'];
  String releaseDate = Get.arguments['releaseDate'];
  double grade = Get.arguments['voteAverage'];
  String tag = Get.arguments['tag'];
  List<int> genreIds = Get.arguments['genreIds'];
  List<GenreEntity> genres = Get.arguments['genres'];
  List<String> genresById = [];

  late YoutubePlayerController youtubePlayerController =
      YoutubePlayerController(
    initialVideoId: YoutubePlayer.convertUrlToId(
      'https://www.youtube.com/watch?v=${key.value}',
    )!,
    flags: const YoutubePlayerFlags(autoPlay: false),
  );

  @override
  void onInit() {
    fetchMovieTrailer();
    getGenreByGenreId();
    favoriteMovieBox = Hive.box('favorities');
    super.onInit();
  }

  @override
  void onClose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.onClose();
  }

  Future<void> fetchMovieTrailer() async {
    final result = await getTrailerByMovieIdUsecase.execute(movieId);
    result.fold((l) => l, (r) => movieTrailer = r);
    key.value = movieTrailer!.key;
  }

  Future<void> onFavoriteButtonTap(BuildContext context) async {
    if (isSnackBarUp == false) {
      isSnackBarUp = true;
      isFavorite.value = !isFavorite.value;
      if (isFavorite.value == true) {
        favoriteMovieBox.put(
          movieTitle,
          MovieEntity(
            image: movieImage,
            name: movieTitle,
            releaseDate: releaseDate,
            overview: movieOverview,
            voteAverage: grade,
            genreIds: genreIds,
            isFavorite: isFavorite.value,
            id: movieId,
          ),
        );
        Get.find<FavoriteController>().updateList();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Movie added to favorite',
              style: TextStyle(
                color: AppColors.accentColor,
              ),
            ),
          ),
        );
        await Future.delayed(const Duration(seconds: 4));
        isSnackBarUp = false;
      } else {
        favoriteMovieBox.delete(movieTitle);
        Get.find<FavoriteController>().updateList();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Movie removed from favorite',
              style: TextStyle(
                color: AppColors.accentColor,
              ),
            ),
          ),
        );
        await Future.delayed(const Duration(seconds: 4));
        isSnackBarUp = false;
      }
    }
  }

  void getGenreByGenreId() {
    for (var element in genres) {
      if (genreIds.contains(element.id)) {
        genresById.add(element.name);
      }
    }
  }
}
