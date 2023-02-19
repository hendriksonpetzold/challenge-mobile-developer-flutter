import 'package:challange_mobile_developer_flutter/domain/entities/movie_trailer_entity.dart';
import 'package:challange_mobile_developer_flutter/domain/errors/errors.dart';
import 'package:challange_mobile_developer_flutter/infra/datasource/movie_trailer_datasource.dart';
import 'package:challange_mobile_developer_flutter/infra/repositories/movie_trailler_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/mocks/get_movie_by_id_mock.dart';

class MovieTrailerDatasourceMock extends Mock
    implements MovieTrailerDatasource {}

void main() {
  final datasource = MovieTrailerDatasourceMock();
  final repository = MovieTraillerRepositoryImpl(datasource: datasource);
  test('should return a MovieTraillerEntity', () async {
    when(() => datasource.getMovieVideos(any())).thenAnswer((_) async => []);

    final result = await repository.getMovieTraillerByMovieId(12);
    expect(result.fold(id, id), isA<MovieTrailerEntity>());
  });

  test('should return a key = _Z3QKkl1WyM', () async {
    when(() => datasource.getMovieVideos(any()))
        .thenAnswer((_) async => movieByIdListMock);

    final result = await repository.getMovieTraillerByMovieId(12);
    MovieTrailerEntity? movieTrailerEntity;
    result.fold((l) => l, (r) => movieTrailerEntity = r);
    expect(movieTrailerEntity!.key, '_Z3QKkl1WyM');
  });
}
