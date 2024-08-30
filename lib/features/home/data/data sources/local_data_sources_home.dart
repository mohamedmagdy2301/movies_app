import 'package:hive/hive.dart';
import 'package:movies_app/core/constant.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

abstract class LocalDataSourcesHome {
  List<MovieEntity> fetchMovies(String category, int pageNumber);
}

class LocalDataSourcesHomeImpl extends LocalDataSourcesHome {
  @override
  List<MovieEntity> fetchMovies(String category, int pageNumber) {
    int startIndex;
    if (pageNumber == 1) {
      startIndex = (pageNumber - 1) * 10;
    } else {
      startIndex = (pageNumber) * 10;
    }
    int endIndex = ((pageNumber + 1) * 10) - 1;
    if (category == 'popular') {
      Box<MovieEntity> moviesBox = Hive.box<MovieEntity>(kPopularMoviesBox);
      List<MovieEntity> moviesList = moviesBox.values.toList();
      return moviesList;
    } else if (category == 'top_rated') {
      Box<MovieEntity> moviesBox = Hive.box<MovieEntity>(kTopRatedMoviesBox);

      if (startIndex >= moviesBox.values.length ||
          endIndex > moviesBox.values.length) {
        return [];
      }
      return moviesBox.values.toList().sublist(startIndex, endIndex);
    } else if (category == 'now_playing') {
      Box<MovieEntity> moviesBox = Hive.box<MovieEntity>(kNowPlayingMoviesBox);
      List<MovieEntity> moviesList = moviesBox.values.toList();
      return moviesList;
    } else if (category == 'upcoming') {
      Box<MovieEntity> moviesBox = Hive.box<MovieEntity>(kUpcomingMoviesBox);
      List<MovieEntity> moviesList = moviesBox.values.toList();
      return moviesList;
    } else {
      return [];
    }
  }
}
