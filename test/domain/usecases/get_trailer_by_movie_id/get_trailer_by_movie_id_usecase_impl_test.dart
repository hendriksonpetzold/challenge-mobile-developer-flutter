import 'package:challange_mobile_developer_flutter/domain/entities/movie_trailer_entity.dart';
import 'package:challange_mobile_developer_flutter/domain/repositories/movie_trailer_repository.dart';
import 'package:challange_mobile_developer_flutter/domain/usecases/get_trailer_by_movie_id/get_trailer_by_movie_id_usecase_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MovieTrailerRepositoryMock extends Mock
    implements MovieTrailerRepository {}

void main() {
  final repository = MovieTrailerRepositoryMock();
  final usecase = GetTrailerByMovieIdUsecaseImpl(repository: repository);
  test('should return a MovieTrailerEntity', () async {
    when(
      () => repository.getMovieTrailerByMovieId(any()),
    ).thenAnswer((_) async => Right(MovieTrailerEntity(key: '', type: '')));
    final result = await usecase.execute(12153);

    expect(result.fold(id, id), isA<MovieTrailerEntity>());
  });
}
