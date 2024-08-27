import 'package:dartz/dartz.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<MovieEntity>>> fetchMovies();
}

class Failure {}
