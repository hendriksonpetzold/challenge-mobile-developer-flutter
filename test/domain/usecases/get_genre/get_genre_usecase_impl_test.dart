import 'package:challange_mobile_developer_flutter/domain/entities/genre_entity.dart';
import 'package:challange_mobile_developer_flutter/domain/repositories/genre_repository.dart';
import 'package:challange_mobile_developer_flutter/domain/usecases/get_genre/get_genre_usecase_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetGenreRepositoryMock extends Mock implements GenreRepository {}

void main() {
  final repository = GetGenreRepositoryMock();
  final usecase = GetGenreUsecaseImpl(repository: repository);

  test('expect to return a List<GenteEntity>', () async {
    when(() => repository.getGenre())
        .thenAnswer((_) async => const Right(<GenreEntity>[]));
    final result = await usecase.execute();
    expect(result.fold(id, id), isA<List<GenreEntity>>());
  });
}
