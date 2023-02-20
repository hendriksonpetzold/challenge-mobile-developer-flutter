import 'package:dartz/dartz.dart';

import '../entities/movie_trailer_entity.dart';
import '../errors/errors.dart';

abstract class MovieTrailerRepository {
  Future<Either<FailureGet, MovieTrailerEntity>> getMovieTrailerByMovieId(
    int id,
  );
}
