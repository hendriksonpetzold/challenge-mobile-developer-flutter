import 'package:challange_mobile_developer_flutter/external/datasources/movie_datasource_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final datasource = MovieDatasourceImpl(dio: dio);
  test('expect to return a List', () async {
    // TODO: Implement test
  });
}
