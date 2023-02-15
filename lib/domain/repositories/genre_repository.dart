import 'package:dartz/dartz.dart';

import '../entities/genre_entity.dart';
import '../errors/errors.dart';

abstract class GenreRepository {
  Future<Either<FailureGet, List<GenreEntity>>> getGenre();
}
