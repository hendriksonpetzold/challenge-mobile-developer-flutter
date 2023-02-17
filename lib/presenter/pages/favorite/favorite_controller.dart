import 'package:challange_mobile_developer_flutter/domain/entities/movie_entity.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class FavoriteController extends GetxController {
  late Box<MovieEntity> favoriteMovieBox;
  RxList<MovieEntity> favoritesList = RxList([]);
  @override
  void onInit() {
    favoriteMovieBox = Hive.box('favorites');

    favoritesList.value = favoriteMovieBox.values.toList().cast<MovieEntity>();

    super.onInit();
  }
}
