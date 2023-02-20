import 'package:challange_mobile_developer_flutter/domain/repositories/movie_repository.dart';
import 'package:challange_mobile_developer_flutter/domain/repositories/movie_trailer_repository.dart';
import 'package:challange_mobile_developer_flutter/domain/usecases/get_movie/get_movie_usecase.dart';
import 'package:challange_mobile_developer_flutter/domain/usecases/get_movie/get_movie_usecase_impl.dart';
import 'package:challange_mobile_developer_flutter/domain/usecases/get_trailer_by_movie_id/get_trailer_by_movie_id_usecase.dart';
import 'package:challange_mobile_developer_flutter/domain/usecases/get_trailer_by_movie_id/get_trailer_by_movie_id_usecase_impl.dart';
import 'package:challange_mobile_developer_flutter/external/datasources/movie_datasource_impl.dart';
import 'package:challange_mobile_developer_flutter/external/datasources/movie_trailer_datasource_impl.dart';
import 'package:challange_mobile_developer_flutter/infra/datasource/movie_datasource.dart';
import 'package:challange_mobile_developer_flutter/infra/datasource/movie_trailer_datasource.dart';
import 'package:challange_mobile_developer_flutter/infra/repositories/movie_repository_impl.dart';
import 'package:challange_mobile_developer_flutter/infra/repositories/movie_trailer_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../domain/repositories/genre_repository.dart';
import '../domain/usecases/get_genre/get_genre_usecase.dart';
import '../domain/usecases/get_genre/get_genre_usecase_impl.dart';
import '../external/datasources/genre_datasource_impl.dart';
import '../infra/datasource/genre_datasource.dart';
import '../infra/repositories/genre_repository_impl.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    final Dio dio = Get.put(Dio());
    final MovieDatasource movieDatasource = Get.put(
      MovieDatasourceImpl(dio: dio),
    );
    final MovieRepository movieRepository = Get.put(
      MovieRepositoryImpl(datasource: movieDatasource),
    );
    Get.put<GetMovieUsecase>(GetMovieUsecaseImpl(repository: movieRepository));

    final GenreDatasource genreDatasource = Get.put(
      GenreDatasourceImpl(dio: dio),
    );
    final GenreRepository genreRepository = Get.put(
      GenreRepositoryImpl(datasource: genreDatasource),
    );
    Get.put<GetGenreUsecase>(GetGenreUsecaseImpl(repository: genreRepository));

    final MovieTrailerDatasource movieTrailerDatasource =
        Get.put(MovieTrailerDatasourceImpl(dio: dio));
    final MovieTrailerRepository movieTraillerRepository =
        Get.put(MovieTrailerRepositoryImpl(datasource: movieTrailerDatasource));
    Get.put<GetTrailerByMovieIdUsecase>(
        GetTrailerByMovieIdUsecaseImpl(repository: movieTraillerRepository));
  }
}
