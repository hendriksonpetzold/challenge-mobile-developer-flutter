import 'package:challange_mobile_developer_flutter/external/datasources/movie_trailer_datasource_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/mocks/get_movie_by_id_mock.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final datasource = MovieTrailerDatasourceImpl(dio: dio);
  test('should return a key = _Z3QKkl1WyM ', () async {
    when(() => dio.get(any())).thenAnswer(
      (_) async => Response(
          requestOptions: RequestOptions(),
          data: movieByIdMock,
          statusCode: 200),
    );
    final result = await datasource.getMovieVideos(20);
    expect(result[0]['key'], '_Z3QKkl1WyM');
  });

  test('should return a Exception', () async {
    when(() => dio.get(any())).thenAnswer(
      (_) async => Response(
          requestOptions: RequestOptions(),
          data: movieByIdMock,
          statusCode: 404),
    );
    final result = datasource.getMovieVideos(20);
    expect(result, throwsException);
  });
}
