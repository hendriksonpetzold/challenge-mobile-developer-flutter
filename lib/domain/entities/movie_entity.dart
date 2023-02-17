import 'package:hive/hive.dart';
part '../../infra/adapters/movie_entity_hive_adapter.g.dart';

@HiveType(typeId: 0)
class MovieEntity {
  @HiveField(0)
  final String image;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String releaseDate;
  @HiveField(3)
  final String overview;
  @HiveField(4)
  final double voteAverage;
  @HiveField(5)
  final List<int> genreIds;
  @HiveField(6)
  final bool? isFavorite;
  @HiveField(7)
  final int id;
  MovieEntity({
    required this.image,
    required this.name,
    required this.releaseDate,
    required this.overview,
    required this.voteAverage,
    required this.genreIds,
    this.isFavorite = false,
    required this.id,
  });
}
