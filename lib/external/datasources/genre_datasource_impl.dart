import 'package:challange_mobile_developer_flutter/domain/errors/errors.dart';
import 'package:challange_mobile_developer_flutter/infra/datasource/genre_datasource.dart';
import 'package:dio/dio.dart';

class GenreDatasourceImpl implements GenreDatasource {
  final Dio dio;

  GenreDatasourceImpl({required this.dio});

  @override
  Future<List> getGenre() async {
    final response = await dio.get(
        'https://api.themoviedb.org/3/genre/movie/list?api_key=141d346633a857c6ffb90bb1c17b46f4&language=en-US');
    if (response.statusCode == 200) {
      final result = response.data['genres'] as List;
      return result;
    } else {
      throw DatasourceError();
    }
  }
}
