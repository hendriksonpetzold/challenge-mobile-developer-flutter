import 'package:challange_mobile_developer_flutter/domain/entities/movie_trailer_entity.dart';
import 'package:challange_mobile_developer_flutter/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class GetTrailerByMovieIdUsecase {
  Future<Either<FailureGet, MovieTrailerEntity>> execute(int id);
}
