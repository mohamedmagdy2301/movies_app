import 'package:hive/hive.dart';
import 'package:movies_app/core/constant.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

abstract class LocalDataSourcesHome {
  List<MovieEntity> fetchMovies();
}

class LocalDataSourcesHomeImpl extends LocalDataSourcesHome {
  @override
  List<MovieEntity> fetchMovies() {
    Box<MovieEntity> moviesBox = Hive.box<MovieEntity>(kMoviesBox);
    List<MovieEntity> moviesList = moviesBox.values.toList();
    return moviesList;
  }
}
