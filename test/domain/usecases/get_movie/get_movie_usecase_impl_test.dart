import 'package:challange_mobile_developer_flutter/domain/entities/movie_entity.dart';
import 'package:challange_mobile_developer_flutter/domain/errors/errors.dart';
import 'package:challange_mobile_developer_flutter/domain/repositories/movie_repository.dart';
import 'package:challange_mobile_developer_flutter/domain/usecases/get_movie/get_movie_usecase_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetMovieRepositoryMock extends Mock implements MovieRepository {}

void main() {
  final repository = GetMovieRepositoryMock();
  final usecase = GetMovieUsecaseImpl(repository: repository);
  test('should return a list of MovieEntity', () async {
    when(() => repository.getMovie(any()))
        .thenAnswer((_) async => const Right(<MovieEntity>[]));
    final result = await usecase.execute(1);
    expect(result.fold(id, id), isA<List<MovieEntity>>());
  });

  test('should return a InvalidPageNumber if you search number 0', () async {
    when(() => repository.getMovie(any()))
        .thenAnswer((_) async => const Right(<MovieEntity>[]));
    final result = await usecase.execute(0);

    expect(result.fold(id, id), isA<InvalidPageNumber>());
  });
}
