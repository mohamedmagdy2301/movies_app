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
    List<MovieEntity> moviesList = [];
    addResultToJsonModel(responseData, moviesList);
    return moviesList;
  }

  void addResultToJsonModel(responseData, List<MovieEntity> moviesList) {
    for (var result in responseData['results']) {
      moviesList.add(MovieModel.fromJson(result));
    }
  }
}
