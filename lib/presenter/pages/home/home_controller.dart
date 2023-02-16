import 'package:challange_mobile_developer_flutter/domain/entities/genre_entity.dart';
import 'package:challange_mobile_developer_flutter/domain/entities/movie_entity.dart';
import 'package:challange_mobile_developer_flutter/domain/usecases/get_genre/get_genre_usecase.dart';
import 'package:challange_mobile_developer_flutter/domain/usecases/get_movie/get_movie_usecase.dart';
import 'package:challange_mobile_developer_flutter/enums/movie_type_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final GetMovieUsecase getMovieUsecase = Get.find<GetMovieUsecase>();
  final GetGenreUsecase getGenreUsecase = Get.find<GetGenreUsecase>();
  final TextEditingController searchEditingController = TextEditingController();
  final RxList<MovieEntity> movies = RxList([]);
  final RxList<MovieEntity> searchMovies = RxList([]);
  final RxList<GenreEntity> genres = RxList([]);
  List<MovieEntity> moviesByGenre = [];
  final Rx<MovieTypeEnum> _movieType = Rx<MovieTypeEnum>(MovieTypeEnum.all);
  RxInt genreId = RxInt(28);
  RxBool test = RxBool(false);
  @override
  void onInit() {
    fetchMovies();
    fetchGenres();
    super.onInit();
  }

  Future<void> fetchMovies() async {
    final result = await getMovieUsecase.execute(1);
    result.fold((l) => l, (r) {
      movies.addAll(r);
      searchMovies.addAll(r);
      moviesByGenre.addAll(r);
    });
  }

  Future<void> fetchGenres() async {
    final result = await getGenreUsecase.execute();
    result.fold((l) => l, (r) => genres.addAll(r));
    genres.refresh();
  }

  Future<void> fetchMoviesByGenre(String genre) async {
    for (var element in genres) {
      if (element.name == genre) {
        genreId.value = element.id;
        List<MovieEntity> newList = movies
            .where((element) => element.genreIds.contains(genreId.value))
            .toList();
        searchMovies.value = newList;
        moviesByGenre = newList;
        break;
      } else {
        searchMovies.value = movies;
        moviesByGenre = movies;
      }
    }
  }

  void searchMovie() {
    List<MovieEntity> newList = moviesByGenre
        .where((item) => item.name.contains(searchEditingController.text))
        .toList();
    searchMovies.value = newList;
  }

  void changeList({required MovieTypeEnum newMovieType}) {
    _movieType.value = newMovieType;
  }

  bool checkActiveList({required MovieTypeEnum newMovieType}) {
    if (newMovieType == _movieType.value) {
      return true;
    } else {
      return false;
    }
  }

  List<MovieTypeEnum> movieTypes = [
    MovieTypeEnum.all,
    MovieTypeEnum.action,
    MovieTypeEnum.adventure,
    MovieTypeEnum.animation,
    MovieTypeEnum.comedy,
    MovieTypeEnum.crime,
    MovieTypeEnum.documentary,
    MovieTypeEnum.drama,
    MovieTypeEnum.family,
    MovieTypeEnum.fantasy,
    MovieTypeEnum.history,
    MovieTypeEnum.horror,
    MovieTypeEnum.music,
    MovieTypeEnum.mystery,
    MovieTypeEnum.romance,
    MovieTypeEnum.scienceFiction,
    MovieTypeEnum.tvMovie,
    MovieTypeEnum.thriller,
    MovieTypeEnum.war,
    MovieTypeEnum.western,
  ];
}
