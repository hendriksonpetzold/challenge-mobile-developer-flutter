import 'package:challange_mobile_developer_flutter/infra/adapters/movie_trailler_adapter.dart';
import 'package:dartz/dartz.dart';

import 'package:challange_mobile_developer_flutter/domain/entities/movie_trailer_entity.dart';
import 'package:challange_mobile_developer_flutter/domain/errors/errors.dart';
import 'package:challange_mobile_developer_flutter/infra/datasource/movie_trailer_datasource.dart';

import '../../domain/repositories/movie_trailler_repository.dart';

class MovieTraillerRepositoryImpl implements MovieTraillerRepository {
  MovieTrailerDatasource datasource;
  MovieTraillerRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<FailureGet, MovieTrailerEntity>> getMovieTraillerByMovieId(
      int id) async {
    try {
      final result = await datasource.getMovieVideos(id);
      final videosList =
          result.map((e) => MovieTraillerAdapter.fromMap(e)).toList();
      MovieTrailerEntity movieTrailler = MovieTrailerEntity(type: '', key: '');
      for (var element in videosList) {
        if (element.type == 'Trailer') {
          movieTrailler = element;
        }
      }
      return Right(movieTrailler);
    } catch (e) {
      return Left(TrailerDatasourceError());
    }
  }
}
