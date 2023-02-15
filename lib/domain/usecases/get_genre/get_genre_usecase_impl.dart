import 'package:dartz/dartz.dart';

import 'package:challange_mobile_developer_flutter/domain/entities/genre_entity.dart';
import 'package:challange_mobile_developer_flutter/domain/errors/errors.dart';
import 'package:challange_mobile_developer_flutter/domain/repositories/get_genre_repository.dart';

import './get_genre_usecase.dart';

class GetGenreUsecaseImpl implements GetGenreUsecase {
  GetGenreRepository repository;
  GetGenreUsecaseImpl({
    required this.repository,
  });

  @override
  Future<Either<FailureGet, List<GenreEntity>>> execute() async {
    return await repository.getGenre();
  }
}
