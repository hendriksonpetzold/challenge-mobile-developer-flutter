import 'package:dartz/dartz.dart';

import '../entities/movie_entity.dart';
import '../errors/errors.dart';

abstract class MovieRepository {
  Future<Either<FailureGet, List<MovieEntity>>> getMovie(int page);
}
