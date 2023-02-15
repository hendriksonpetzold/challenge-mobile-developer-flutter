import 'package:challange_mobile_developer_flutter/infra/adapters/movie_adapter.dart';
import 'package:dartz/dartz.dart';

import 'package:challange_mobile_developer_flutter/domain/entities/movie_entity.dart';
import 'package:challange_mobile_developer_flutter/domain/errors/errors.dart';
import 'package:challange_mobile_developer_flutter/domain/repositories/movie_repository.dart';
import 'package:challange_mobile_developer_flutter/infra/datasource/movie_datasource.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieDatasource datasource;
  MovieRepositoryImpl({
    required this.datasource,
  });
  @override
  Future<Either<FailureGet, List<MovieEntity>>> getMovie(int page) async {
    try {
      final result = await datasource.getMovie(page);
      return Right(result.map((e) => MovieAdapter.fromMap(e)).toList());
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
