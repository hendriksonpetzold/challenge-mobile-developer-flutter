import 'package:challange_mobile_developer_flutter/domain/errors/errors.dart';
import 'package:challange_mobile_developer_flutter/domain/entities/genre_entity.dart';
import 'package:challange_mobile_developer_flutter/domain/repositories/genre_repository.dart';
import 'package:challange_mobile_developer_flutter/infra/adapters/genre_adapter.dart';
import 'package:challange_mobile_developer_flutter/infra/datasource/genre_datasource.dart';
import 'package:dartz/dartz.dart';

class GenreRepositoryImpl implements GenreRepository {
  GenreDatasource datasource;

  GenreRepositoryImpl({
    required this.datasource,
  });
  @override
  Future<Either<FailureGet, List<GenreEntity>>> getGenre() async {
    final result = await datasource.getGenre();
    return Right(result.map((e) => GenreAdapter.fromMap(e)).toList());
  }
}
