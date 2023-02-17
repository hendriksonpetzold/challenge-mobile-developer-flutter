import 'package:dartz/dartz.dart';

import 'package:challange_mobile_developer_flutter/domain/entities/movie_trailer_entity.dart';
import 'package:challange_mobile_developer_flutter/domain/errors/errors.dart';
import 'package:challange_mobile_developer_flutter/domain/repositories/movie_trailler_repository.dart';

import './get_trailer_by_movie_id_usecase.dart';

class GetTrailerByMovieIdUsecaseImpl implements GetTrailerByMovieIdUsecase {
  MovieTraillerRepository repository;
  GetTrailerByMovieIdUsecaseImpl({
    required this.repository,
  });

  @override
  Future<Either<FailureGet, MovieTrailerEntity>> execute(int id) async {
    return await repository.getMovieTraillerByMovieId(id);
  }
}
