import 'package:challange_mobile_developer_flutter/external/datasources/movie_datasource_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/mocks/get_movies_mock.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final datasource = MovieDatasourceImpl(dio: dio);
  test('should completes and returns a Future', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
          requestOptions: RequestOptions(),
          data: {'results': []},
          statusCode: 200,
        ));
    final result = datasource.getMovie(1);
    expect(result, completes);
    expect(result, isA<Future<List>>());
  });
  test('should returns a list', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
          requestOptions: RequestOptions(),
          data: {'results': []},
          statusCode: 200,
        ));
    final result = await datasource.getMovie(1);
    expect(result, isA<List>());
  });

  test('should get movie id', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
          requestOptions: RequestOptions(),
          data: moviesMock,
          statusCode: 200,
        ));
    final result = await datasource.getMovie(1);

    expect(result, isA<List>());
    expect(result[0]['id'], 505642);
  });
}
