import 'package:challange_mobile_developer_flutter/domain/entities/genre_entity.dart';

class GenreAdapter {
  static GenreEntity fromMap(Map<String, dynamic> map) {
    return GenreEntity(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }
}
