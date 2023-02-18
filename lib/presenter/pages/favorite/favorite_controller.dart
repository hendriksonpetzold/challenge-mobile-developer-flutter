import 'package:challange_mobile_developer_flutter/domain/entities/movie_entity.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class FavoriteController extends GetxController {
  late Box<MovieEntity> favoriteMovieBox;
  RxList<MovieEntity> favoriteMovies = RxList([]);
  @override
  void onInit() {
    favoriteMovieBox = Hive.box('favorities');

    favoriteMovies.value = favoriteMovieBox.values.toList().cast<MovieEntity>();

    super.onInit();
  }

  void updateList() {
    favoriteMovies.value = favoriteMovieBox.values.toList().cast<MovieEntity>();
  }
}
