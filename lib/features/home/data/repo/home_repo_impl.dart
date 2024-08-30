import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/home/data/data%20sources/local_data_sources_home.dart';
import 'package:movies_app/features/home/data/data%20sources/remote_data_sources_home.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/home/domain/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  RemoteDataSourcesHomeImpl remoteDataSourcesHomeImpl;
  LocalDataSourcesHomeImpl localDataSourcesHomeImpl;
  HomeRepoImpl({
    required this.remoteDataSourcesHomeImpl,
    required this.localDataSourcesHomeImpl,
  });

  @override
  Future<Either<Failure, List<MovieEntity>>> fetchMovies(
      category, pageNumber) async {
    try {
      List<MovieEntity> movies;
      movies = localDataSourcesHomeImpl.fetchMovies(category, pageNumber);
      if (movies.isNotEmpty) {
        return right(movies);
      }
      movies =
          await remoteDataSourcesHomeImpl.fetchMovies(category, pageNumber);
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
