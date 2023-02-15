import 'package:dartz/dartz.dart';

import 'package:challange_mobile_developer_flutter/domain/entities/movie_entity.dart';
import 'package:challange_mobile_developer_flutter/domain/errors/errors.dart';
import 'package:challange_mobile_developer_flutter/domain/repositories/get_movie_repository.dart';

import './get_movie_usecase.dart';

class GetMovieUsecaseImpl implements GetMovieUsecase {
  GetMovieRepository repository;
  GetMovieUsecaseImpl({
    required this.repository,
  });

  @override
  Future<Either<FailureGet, List<MovieEntity>>> execute(int page) async {
    if (page == 0) {
      return Left(InvalidPageNumber());
    }

    return await repository.getMovie(page);
  }
}
