import 'package:challange_mobile_developer_flutter/domain/entities/movie_entity.dart';
import 'package:challange_mobile_developer_flutter/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class GetMovieUsecase {
  Future<Either<FailureGet, List<MovieEntity>>> execute(int page);
}
