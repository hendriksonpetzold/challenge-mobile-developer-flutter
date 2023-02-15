import 'package:challange_mobile_developer_flutter/domain/entities/movie_entity.dart';
import 'package:challange_mobile_developer_flutter/domain/usecases/get_movie/get_movie_usecase.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final GetMovieUsecase getMovieUsecase = Get.find<GetMovieUsecase>();
  final RxList<MovieEntity> movies = RxList([]);
  @override
  void onInit() {
    fetchMovies();
    super.onInit();
  }

  Future<void> fetchMovies() async {
    final result = await getMovieUsecase.execute(1);
    result.fold((l) => l, (r) => movies.addAll(r));
  }
}
