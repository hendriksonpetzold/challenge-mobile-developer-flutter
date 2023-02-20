import 'package:challange_mobile_developer_flutter/domain/entities/movie_entity.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../domain/entities/genre_entity.dart';
import '../../../domain/usecases/get_genre/get_genre_usecase.dart';

class FavoriteController extends GetxController {
  final GetGenreUsecase getGenreUsecase = Get.find<GetGenreUsecase>();
  late Box<MovieEntity> favoriteMovieBox;
  RxList<MovieEntity> favoriteMovies = RxList([]);
  final RxList<GenreEntity> genres = RxList([]);
  @override
  void onInit() {
    favoriteMovieBox = Hive.box('favorities');

    favoriteMovies.value = favoriteMovieBox.values.toList().cast<MovieEntity>();

    super.onInit();
  }

  void updateList() {
    favoriteMovies.value = favoriteMovieBox.values.toList().cast<MovieEntity>();
  }

  Future<void> fetchGenres() async {
    final result = await getGenreUsecase.execute();
    result.fold((l) => l, (r) => genres.addAll(r));
  }
}
