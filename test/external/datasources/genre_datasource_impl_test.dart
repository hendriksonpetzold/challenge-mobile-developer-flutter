import 'package:challange_mobile_developer_flutter/external/datasources/genre_datasource_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/mocks/get_genre_mock.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final datasource = GenreDatasourceImpl(dio: dio);
  test('should complete and return a Future<List>', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
          requestOptions: RequestOptions(),
          data: {'genres': []},
          statusCode: 200,
        ));
    final result = datasource.getGenre();
    expect(result, completes);
    expect(result, isA<Future<List>>());
  });

  test('should return a Exception', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
          requestOptions: RequestOptions(),
          data: {'genres': []},
          statusCode: 404,
        ));
    final result = datasource.getGenre();
    expect(result, throwsException);
  });

  test('should complete and return a Adventure', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
          requestOptions: RequestOptions(),
          data: genreMock,
          statusCode: 200,
        ));
    final result = await datasource.getGenre();

    expect(result, isA<List>());
    expect(result[1]['name'], 'Adventure');
  });
  test('should complete and return 16', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
          requestOptions: RequestOptions(),
          data: genreMock,
          statusCode: 200,
        ));
    final result = await datasource.getGenre();

    expect(result, isA<List>());
    expect(result[2]['id'], 16);
  });
}
