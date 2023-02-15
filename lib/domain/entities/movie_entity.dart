class MovieEntity {
  final String name;
  final String image;
  final String releaseDate;
  final String overview;
  final double voteAverage;
  final List<int> genreIds;
  final bool isFavorite;
  MovieEntity({
    required this.name,
    required this.image,
    required this.releaseDate,
    required this.overview,
    required this.voteAverage,
    required this.genreIds,
    this.isFavorite = false,
  });
}
