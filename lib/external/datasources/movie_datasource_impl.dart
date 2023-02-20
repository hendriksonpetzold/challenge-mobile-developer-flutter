import 'package:challange_mobile_developer_flutter/domain/errors/errors.dart';
import 'package:challange_mobile_developer_flutter/infra/datasource/movie_datasource.dart';
import 'package:dio/dio.dart';

class MovieDatasourceImpl implements MovieDatasource {
  final Dio dio;

  MovieDatasourceImpl({required this.dio});

  @override
  Future<List> getMovie(int page) async {
    final response = await dio.get(
        'https://api.themoviedb.org/3/movie/popular?api_key=141d346633a857c6ffb90bb1c17b46f4&language=en-US&page=$page');

    if (response.statusCode == 200) {
      final result = response.data['results'] as List;
      return result;
    } else {
      throw MovieDatasourceError();
    }
  }
}
