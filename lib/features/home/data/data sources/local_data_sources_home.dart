import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

abstract class LocalDataSourcesHome {
  List<MovieEntity> fetchMovies();
}

class LocalDataSourcesHomeImpl extends LocalDataSourcesHome {
  @override
  List<MovieEntity> fetchMovies() {
    List<MovieEntity> moviesList = [];
    return moviesList;
  }
}
