// import 'package:hive/hive.dart';
// import 'package:movies_app/core/constant.dart';
// import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

// abstract class LocalDataSourcesHome {
//   List<MovieEntity> fetchMovies(String category, int pageNumber);
// }

// class LocalDataSourcesHomeImpl extends LocalDataSourcesHome {
//   @override
//   List<MovieEntity> fetchMovies(String category, int pageNumber) {
//     int startIndex;
//     if (pageNumber == 1) {
//       startIndex = 0;
//     } else {
//       startIndex = (pageNumber) * 10;
//     }
//     int endIndex = startIndex + 20;
//     if (category == 'popular') {
//       Box<MovieEntity> moviesBox = Hive.box<MovieEntity>(kPopularMoviesBox);

//       if (startIndex >= moviesBox.values.length ||
//           endIndex > moviesBox.values.length) {
//         return [];
//       }
//       return moviesBox.values.toList().sublist(startIndex, endIndex);
//     } else if (category == 'top_rated') {
//       Box<MovieEntity> moviesBox = Hive.box<MovieEntity>(kTopRatedMoviesBox);

//       if (startIndex >= moviesBox.values.length ||
//           endIndex > moviesBox.values.length) {
//         return [];
//       }
//       return moviesBox.values.toList().sublist(startIndex, endIndex);
//     } else if (category == 'now_playing') {
//       Box<MovieEntity> moviesBox = Hive.box<MovieEntity>(kNowPlayingMoviesBox);

//       if (startIndex >= moviesBox.values.length ||
//           endIndex > moviesBox.values.length) {
//         return [];
//       }
//       return moviesBox.values.toList().sublist(startIndex, endIndex);
//     } else if (category == 'upcoming') {
//       Box<MovieEntity> moviesBox = Hive.box<MovieEntity>(kUpcomingMoviesBox);

//       if (startIndex >= moviesBox.values.length ||
//           endIndex > moviesBox.values.length) {
//         return [];
//       }
//       return moviesBox.values.toList().sublist(startIndex, endIndex);
//     } else {
//       return [];
//     }
//   }
// }
import 'package:hive/hive.dart';
import 'package:movies_app/core/constant.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

abstract class LocalDataSourcesHome {
  List<MovieEntity> fetchMovies(String category, int pageNumber);
}

class LocalDataSourcesHomeImpl extends LocalDataSourcesHome {
  @override
  List<MovieEntity> fetchMovies(String category, int pageNumber) {
    int startIndex = (pageNumber - 1) * 20;
    int endIndex = startIndex + 20;

    // Retrieve the appropriate Hive box based on the category
    final moviesBox = _getMoviesBox(category);

    if (moviesBox == null || startIndex >= moviesBox.values.length) {
      return [];
    }

    // Adjust endIndex to not exceed the available list length
    endIndex = endIndex.clamp(0, moviesBox.values.length);

    return moviesBox.values.toList().sublist(startIndex, endIndex);
  }

  // Helper method to get the correct box based on category
  Box<MovieEntity>? _getMoviesBox(String category) {
    switch (category) {
      case 'popular':
        return Hive.box<MovieEntity>(kPopularMoviesBox);
      case 'top_rated':
        return Hive.box<MovieEntity>(kTopRatedMoviesBox);
      case 'now_playing':
        return Hive.box<MovieEntity>(kNowPlayingMoviesBox);
      case 'upcoming':
        return Hive.box<MovieEntity>(kUpcomingMoviesBox);
      default:
        return null;
    }
  }
}
