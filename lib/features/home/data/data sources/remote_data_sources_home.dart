import 'package:hive/hive.dart';
import 'package:movies_app/core/constant.dart';
import 'package:movies_app/core/models/movie.dart';
import 'package:movies_app/core/utils/api_service.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

abstract class RemoteDataSourcesHome {
  Future<List<MovieEntity>> fetchMovies(String category);
}

class RemoteDataSourcesHomeImpl extends RemoteDataSourcesHome {
  ApiService apiService;
  RemoteDataSourcesHomeImpl({required this.apiService});

  @override
  Future<List<MovieEntity>> fetchMovies(String category) async {
    Map<String, dynamic> responseData = await apiService.get(category);
    List<MovieEntity> movies = addResultToJsonModel(responseData);
    saveMoviesInLocalDataSources(movies, category);
    return movies;
  }

  void saveMoviesInLocalDataSources(List<MovieEntity> movies, String category) {
    Box<MovieEntity> moviesBox = Hive.box<MovieEntity>(category);
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
