import 'package:dartz/dartz.dart';

import '../entities/movie_trailer_entity.dart';
import '../errors/errors.dart';

abstract class MovieTraillerRepository {
  Future<Either<FailureGet, MovieTrailerEntity>> getMovieTraillerByMovieId(
    int id,
  );
}
