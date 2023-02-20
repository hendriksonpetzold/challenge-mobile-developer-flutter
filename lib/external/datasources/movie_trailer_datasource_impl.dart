// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:challange_mobile_developer_flutter/domain/errors/errors.dart';
import 'package:dio/dio.dart';

import '../../infra/datasource/movie_trailer_datasource.dart';

class MovieTrailerDatasourceImpl implements MovieTrailerDatasource {
  Dio dio;
  MovieTrailerDatasourceImpl({
    required this.dio,
  });
  @override
  Future<List> getMovieVideos(int id) async {
    final response = await dio.get(
        'http://api.themoviedb.org/3/movie/$id?api_key=141d346633a857c6ffb90bb1c17b46f4&append_to_response=videos');
    if (response.statusCode == 200) {
      final result = response.data['videos']['results'] as List;
      return result;
    } else {
      throw TrailerDatasourceError();
    }
  }
}
