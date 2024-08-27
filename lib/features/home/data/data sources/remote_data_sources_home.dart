import 'package:hive/hive.dart';
import 'package:movies_app/core/constant.dart';
import 'package:movies_app/core/models/movie.dart';
import 'package:movies_app/core/utils/api_service.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

abstract class RemoteDataSourcesHome {
  Future<List<MovieEntity>> fetchMovies();
}

class RemoteDataSourcesHomeImpl extends RemoteDataSourcesHome {
  ApiService apiService;
  RemoteDataSourcesHomeImpl({required this.apiService});

  @override
  Future<List<MovieEntity>> fetchMovies() async {
    Map<String, dynamic> responseData = await apiService.get('popular');
    List<MovieEntity> movies = addResultToJsonModel(responseData);
    saveMoviesInLocalDataSources(movies);
    return movies;
  }

  void saveMoviesInLocalDataSources(List<MovieEntity> movies) {
    Box<MovieEntity> moviesBox = Hive.box<MovieEntity>(kMoviesBox);
    moviesBox.addAll(movies);
  }

  List<MovieEntity> addResultToJsonModel(responseData) {
    List<MovieEntity> moviesList = [];
    for (var result in responseData['results']) {
      moviesList.add(MovieModel.fromJson(result));
    }
    return moviesList;
  }
}
