import 'package:challange_mobile_developer_flutter/domain/entities/movie_entity.dart';
import 'package:challange_mobile_developer_flutter/domain/errors/errors.dart';
import 'package:challange_mobile_developer_flutter/domain/usecases/get_movie/get_movie_usecase_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final usecase = GetMovieUsecaseImpl();
  test('expect to return a List of MovieEntity', () async {
    final result = await usecase.execute(1);
    expect(result, isA<Right>());
    expect(result.getOrElse(() => null), isA<List<MovieEntity>>());
  });
}
