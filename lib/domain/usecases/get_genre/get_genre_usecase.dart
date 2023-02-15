import 'package:challange_mobile_developer_flutter/domain/entities/genre_entity.dart';
import 'package:challange_mobile_developer_flutter/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class GetGenreUsecase {
  Future<Either<FailureGet, List<GenreEntity>>> execute();
}
