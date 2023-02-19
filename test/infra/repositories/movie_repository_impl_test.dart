import 'package:challange_mobile_developer_flutter/domain/entities/movie_entity.dart';
import 'package:challange_mobile_developer_flutter/domain/errors/errors.dart';
import 'package:challange_mobile_developer_flutter/infra/datasource/movie_datasource.dart';
import 'package:challange_mobile_developer_flutter/infra/repositories/movie_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MovieDatasourceMock extends Mock implements MovieDatasource {}

void main() {
  final datasource = MovieDatasourceMock();
  final repository = MovieRepositoryImpl(datasource: datasource);

  test('expect to return a list of MovieEntity', () async {
    when(() => datasource.getMovie(any()))
        .thenAnswer((_) async => <MovieEntity>[]);
    final result = await repository.getMovie(1);
    expect(result.fold(id, id), isA<List<MovieEntity>>());
  });

  test('expect to return a DatasourceError if the datasource fail', () async {
    when(() => datasource.getMovie(any())).thenThrow(Exception());
    final result = await repository.getMovie(1);
    expect(result.fold(id, id), isA<MovieDatasourceError>());
  });
}
