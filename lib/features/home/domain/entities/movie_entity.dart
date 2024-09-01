import 'package:hive/hive.dart';

part 'movie_entity.g.dart';

@HiveType(typeId: 0)
class MovieEntity {
  @HiveField(9)
  final int? id;
  @HiveField(0)
  final String? title;
  @HiveField(1)
  final String? overview;
  @HiveField(2)
  String? posterPath;
  @HiveField(3)
  final String? backdropPath;
  @HiveField(4)
  final num? voteAverage;
  @HiveField(5)
  final num? voteCount;
  @HiveField(6)
  final String? releaseDate;
  @HiveField(7)
  final bool? isFavorite;
  @HiveField(8)
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

  String get posterImageUrl =>
      'https://image.tmdb.org/t/p/w500${posterPath ?? "/1KJtjg3MQFnrfd7NXfs11z4HLwD.jpg"}';
  String get backdropImageUrl => 'https://image.tmdb.org/t/p/w500$backdropPath';
}
