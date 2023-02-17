import 'package:challange_mobile_developer_flutter/domain/entities/movie_trailer_entity.dart';
import 'package:challange_mobile_developer_flutter/domain/usecases/get_trailer_by_movie_id/get_trailer_by_movie_id_usecase.dart';

import 'package:get/get.dart';

class MovieDetailPageController extends GetxController {
  MovieTrailerEntity? movieTrailer;
  final GetTrailerByMovieIdUsecase getTrailerByMovieIdUsecase =
      Get.find<GetTrailerByMovieIdUsecase>();
  int movieId = Get.arguments['movieId'];
  String movieImage = Get.arguments['movieImage'];
  String movieTitle = Get.arguments['movieTitle'];
  String movieOverview = Get.arguments['movieOverview'];
  String releaseDate = Get.arguments['releaseDate'];
  double grade = Get.arguments['voteAverage'];

  @override
  void onInit() {
    fetchMovieTrailer();
    super.onInit();
  }

  Future<void> fetchMovieTrailer() async {
    final result = await getTrailerByMovieIdUsecase.execute(movieId);
    result.fold((l) => l, (r) => movieTrailer = r);
    print(movieTrailer!.key);
  }
}
