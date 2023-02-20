import 'package:challange_mobile_developer_flutter/domain/entities/genre_entity.dart';
import 'package:challange_mobile_developer_flutter/domain/errors/errors.dart';
import 'package:challange_mobile_developer_flutter/infra/datasource/genre_datasource.dart';
import 'package:challange_mobile_developer_flutter/infra/repositories/genre_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GenreDatasourceMock extends Mock implements GenreDatasource {}

void main() {
  final datasource = GenreDatasourceMock();
  final repository = GenreRepositoryImpl(datasource: datasource);
  test('expect to return a list of GenreEntity', () async {
    when(() => datasource.getGenre()).thenAnswer((_) async => <GenreEntity>[]);
    final result = await repository.getGenre();
    expect(result.fold(id, id), isA<List<GenreEntity>>());
  });

  test('expect to return a DatasourceError if the datasource fail', () async {
    when(() => datasource.getGenre()).thenThrow(Exception());
    final result = await repository.getGenre();
    expect(result.fold(id, id), isA<GenreDatasourceError>());
  });
}
