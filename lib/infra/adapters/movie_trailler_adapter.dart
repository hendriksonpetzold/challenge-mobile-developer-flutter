import 'package:challange_mobile_developer_flutter/domain/entities/movie_trailer_entity.dart';

class MovieTraillerAdapter {
  static MovieTrailerEntity fromMap(Map<String, dynamic> map) {
    return MovieTrailerEntity(
      type: map['type'],
      key: map['key'],
    );
  }
}
