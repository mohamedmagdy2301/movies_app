class MovieEntity {
  final int? id;
  final String? title;
  final String? overview;
  final String? posterPath;
  final String? backdropPath;
  final num? voteAverage;
  final num? voteCount;
  final String? releaseDate;
  final bool? isFavorite;
  final num? popularity;

  MovieEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
    required this.voteCount,
    required this.releaseDate,
    required this.isFavorite,
    required this.popularity,
  });

  // String get posterImageUrl => 'https://image.tmdb.org/t/p/w500$posterPath';
  // String get backdropImageUrl => 'https://image.tmdb.org/t/p/w500$backdropPath';
}
